# Opaque Types

Why to use them and not protocols as a return type:

Because opaque types mean that even generic protocols (a protocol that either has associated types or references to `Self`) can now be used as return types — just as if they were concrete types — like non-generic protocols, classes or structs

1. **When we have an associated type** (opaque type is some congregate type so compiler can infer associated type)
2. **`Self` using in protocol requirements** (because when we use just protocol compiler can’t proof that the underline types are same and for example comparing String with Int make no sense and it’s unsafe, so compiler saves us from this mistake)
    
    **Mark**: Protocols with `Self` can be used only as generic constraints (`example func a<T: SomeProtocol>() { … }`)
    
3. **When you need nest functions call’s that’s return a protocol.** Values of protocol doesn’t conform to that protocol, but when we use an opaque type, it’s always some concrete type, so we can nest this calls.
4. **When we have a complex nested types** (`LazyMapSequence<ArraySlice<T>, T>`) so we don’t need to correct them when realization is changing (useful in SwiftUI, DSL) and if we designing API to not throw all of this at a call site

So, opaque result types allow us to do several things:

- Our functions decide what type of data gets returned, not the caller of those functions.
- We don’t need to worry about Self or associated type requirements, because the compiler knows exactly what type is inside.
- We get to change our minds in the future whenever we need to.
- We don’t expose private internal types to the outside world.