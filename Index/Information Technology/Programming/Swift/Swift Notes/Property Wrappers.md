## General

Often we need to code something like this

```swift
struct ConsoleLogged<Value> {
    private var value: Value
    
    init(wrappedValue: Value) {
        self.value = wrappedValue
    }

    var wrappedValue: Value {
        get { value }
        set { 
            value = newValue
            print("New value is \(newValue)") 
        }
    }
}

struct Bar {
    private var _x = ConsoleLogged<Int>(wrappedValue: 0)
    
    var x: Int {
        get { _x.wrappedValue }
        set { _x.wrappedValue = newValue }
    }
}

var bar = Bar()
bar.x = 1 // Prints 'New value is 1'
```

We can achieve same functionality with `@propertyWrapper`

```swift
@propertyWrapper
struct B {
    var _wrappedValue: Int = 0
    
    var wrappedValue: Int {
        set {
            _wrappedValue = newValue
            print("SET \(newValue)")
        }
        get { _wrappedValue }
    }
    
    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }
    
    func foo() { print("FOO") }
    
    var projectedValue: Self { self } // to use $
    
}

struct A {
    @B var property: Int = 0 // same as @B(wrappedValue: 0) var property
    
    func foo() {
        _property.foo()
    }
}

var aa = A()
aa.property = 40
aa.foo()
aa.$property.foo()
```

## Referring to the self in property wrapper

```swift
@propertyWrapper
public struct Observable<Value> {
  private var stored: Value
  
  public init(wrappedValue: Value) {
    self.stored = wrappedValue
  }
  
	// this
  public static subscript<OuterSelf: Observed>(
      instanceSelf observed: OuterSelf,
      wrapped wrappedKeyPath: ReferenceWritableKeyPath<OuterSelf, Value>,
      storage storageKeyPath: ReferenceWritableKeyPath<OuterSelf, Self>
    ) -> Value {
    get {
      observed[keyPath: storageKeyPath].stored
    }
    set {
      let oldValue = observed[keyPath: storageKeyPath].stored
      if newValue != oldValue {
        observed.broadcastValueWillChange(newValue: newValue)
      }
      observed[keyPath: storageKeyPath].stored = newValue
    }
  }
}

public class MyClass: Superclass {
  @Observable public var myVar: Int = 17
  
  // desugars to...
  private var _myVar: Observable<Int> = Observable(wrappedValue: 17)
  public var myVar: Int {
	    get { 
					Observable<Int>[
							instanceSelf: self,
							wrapped: \MyClass.myVar, 
							storage: \MyClass._myVar
					] 
			}
	    set { 
					Observable<Int>[
							instanceSelf: self, 
							wrapped: \MyClass.myVar, 
							storage: \MyClass._myVar
					] = newValue 
			}
	}
}
```

```swift
// due to self should be an reference type 
@availability(*, unavailable) 
var wrappedValue: Value {
  get { fatalError("only works on instance properties of classes") }
  set { fatalError("only works on instance properties of classes") }
}
```