# Blocks

# Blocks

[http://fuckingblocksyntax.com/](http://fuckingblocksyntax.com/)

Blocks in objc - is object (so it’s can use reference count)

## Best practices

- Always a last argument in method
- Use typedefs

**`typedef**returnType (^TypeName)(parameterTypes);`

`// example` **`typedef**NSString* (^CustomBlock)(**void**);` `CustomBlock block = ^{` **`return**@"Hello, World!";` `};` `NSLog(@"%@", block()); // Hello, World!`

- Use properties with ***copy*** attribute
- Avoid retain cycles using ***weakify***

## Types of blocks

There are three types of blocks: - Global - Stack (only MRC) - Malloc (heap)

**Global blocks** - blocks that don’t capture external variables or only static vars

If block is **capturing some context** - it will be **created in stack** not in heap

## Reference count with blocks

Property should be marked as ***copy***

To store blocks in some property etc. (i.e. store it into heap) you can call ***[copy]*** on it, but with ARC in the end of method ***[copy]*** will be called implicitly (so because of that **you** **can’t get a stack block in ARC**)

If we call*** [copy] ***on global block - nothing happens

## Capturing variables

Variables are capturing as ***const*** in blocks (so you can’t mutate them in block)

To make them mutable mark them as ***__block ***

If variable marked with ***__block*** and it’s changing after declaration of block - value in block is also changing

`// With __block`

**`__blockint**multiplier = 7;` **`int**(^myBlock)(**int**) = ^(**int**num) {` `multiplier = 10; // OK` **`return**num * multiplier;` `};`  `...`

`// Without __block`

**`int**multiplier = 7;` **`int**(^myBlock)(**int**) = ^(**int**num) {` `multiplier = 10; // Compiler error` **`return**num * multiplier;` `};`  `...`

`// With __block`

**`__blockint**multiplier = 7;` **`int**(^myBlock)(**int**) = ^(**int**num) {` **`return**num * multiplier;` `};`  `multiplier = 10;`  `NSLog(@"%@", myBlock(3)); // 30`

`// Without __block`  **`int**multiplier = 7;` **`int**(^myBlock)(**int**) = ^(**int**num) {` **`return**num * multiplier;` `};`  `multiplier = 10;`  `NSLog(@"%@", myBlock(3)); // 21`

Same with pointer variables

**`__block**NSMutableString *str1 = [NSMutableString stringWithString:@"Hello"];` `NSMutableString *str2 = [NSMutableString stringWithString:@"World!"];`  `NSString *(^myBlock)(**void**) = ^{` **`return**[NSString stringWithString:str1];` `};`  `str1 = str2;`  `NSLog(@"%@", myBlock()); // World!`

## Stroring blocks

When the block is copied it’s make a strong reference to all captured object variables

Global and static variables not capturing as ***const*** so no need in ***__block  ******  ******  ***## Issues*** ##

---

Problem

![[Blocks/property(nonatomic_copy)_int_(myBlock)(int).png]]_int_(myBlock)(int).png)

To solve it we can use: - ***__weak ***to make a weak reference and capture it*** (this only for ARC) ***-*** __strong ***to make a strong ref in block

![[Blocks/Make_weakify_using___weak_modifier.png]]

![[Blocks/Make_weakify_using__weak_modifier.png]]

`__block` makes reference weak in MRC

![[Blocks/Make_weakify_using____block_modifier.png]]