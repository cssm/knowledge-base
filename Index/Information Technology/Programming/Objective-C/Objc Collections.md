# Collections

# Collections

[https://www.objc.io/issues/7-foundation/collections/](https://www.objc.io/issues/7-foundation/collections/)

## NSPointerArray

- When no more strong refs to stored object -> object will be removed (in case of weak init)
- To store pointers to another objects (generally it’s weak pointers to some objects)
- You can store ***nil***
- No subscripting

## NSCountedSet

- Shows how many times some object was added to set (***[set countForObject:@1]***)
- Global counter for whole set steel the same
- Inc/decr counter for object on add/remove

`NSCountedSet *set = [NSCountedSet setWithObjects:@1, @2, @3,**nil**];` `[set addObject:@1];` `NSLog(@"%lu", (**unsignedlong**)set.count); // 3` `NSLog(@"%lu", (**unsignedlong**)[set countForObject:@1]); // 2` `[set removeObject:@1];` `NSLog(@"%lu", (**unsignedlong**)set.count); // 3` `NSLog(@"%lu", (**unsignedlong**)[set countForObject:@1]); // 1` `[set removeObject:@1];` `NSLog(@"%lu", (**unsignedlong**)set.count); // 2` `NSLog(@"%lu", (**unsignedlong**)[set countForObject:@1]); // 0`

## NSHashTable

Similar to ***NSSet*** but like ***NSPointerArray*** or ***NSMapTable***  ******  ****** 

## Collections copy

![[Collections/Types_of_Copies.png]]

Collections-1

**`// Shallow Copy`**

`NSMutableString *str = [NSMutableString stringWithString:@"Hello"];`  `NSArray *arr = @[ str ];`  `NSArray *shallowCopy = [NSArray arrayWithArray:arr];`  `NSLog(@"%@", arr.firstObject); // Hello` `NSLog(@"%@", shallowCopy.firstObject); // Hello`  `[str appendString:@", World!"];`  `NSLog(@"%@", arr.firstObject); // Hello, World!` `NSLog(@"%@", shallowCopy.firstObject); // Hello, World!`

**`// Deep copy`**

`NSMutableString *str = [NSMutableString stringWithString:@"Hello"];`  `NSArray *arr = @[ str ];`  `NSArray *deepCopy = [[NSArray alloc] initWithArray:arr copyItems:**YES**];`  `NSLog(@"%@", arr.firstObject); // Hello` `NSLog(@"%@", deepCopy.firstObject); // Hello`  `[str appendString:@", World!"];`  `NSLog(@"%@", arr.firstObject); // Hello, World!` `NSLog(@"%@", deepCopy.firstObject); // Hello`

In case of nested arrays deep copy won’t work

For real deep copy use next approach

![[Collections/Deep_Copy.png]]

Collections-2

Example of when deep copy not working

![[Collections/NSArray_array____string.png]]

Collections-3

## Enumeration of collection

- C style
    - ***for (int i = 0; I < arr.count; I++)***
- Fase enumeration
    - ***for (int i in arr)***
- Block based
- NSEnumerator ******

## Generics

Generics in objc is lightweight (that means that we can get only warning from compiler)

Collections-4

![[Collections/NSArrayNSString__arr__L_Hi_Hello_1.png]]