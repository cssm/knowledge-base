# Classes

# Classes

Class declares like this

```objectivec
// in header file (.h)
    
@interface ClassName: NSObject <Some Prorocol> {
		int someInstanceVar;
}
- (int)getInt;
@end
```

Than implementation

```objectivec
// in .m file (m is stood for messages or iMplemetation)
    
@implementation ClassName
    - (int)getInt {
    	return 5;
		}
@end
```