Do not use it in real code. No actual benefits in performance or memory usage. Can case [pain in ass](https://betterexplained.com/articles/swap-two-variables-using-xor/) if doing it to pointers/references on the same object

## XOR

```
1 XOR 1 = 0

0 XOR 0 = 0

1 XOR 0 = 1

0 XOR 1 = 1
```

## XOR - nice way to store values

```swift
var a = 3
var b = 1
// combine values together
var c = a ^ b // 2

// restore value back
var d = c ^ b == a // true
```

## Swap

```swift
var a = 3
var b = 1

// combined values of a and b
a = a ^ b

// remove b value from combined value (restore `a`)
b = a ^ b 

// b is now == a, so remove old a value from combined value (restore `b`)
a = a ^ b 
```
