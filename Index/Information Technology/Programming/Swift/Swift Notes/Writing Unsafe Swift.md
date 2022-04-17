# Writing Unsafe Swift

- [Swift And C: Everything You Need to Know on Types, Pointers and more - uraimo.com](https://www.uraimo.com/2016/04/07/swift-and-c-everything-you-need-to-know/)
- [Unsafe memory pointers in Swift - The.Swift.Dev.](https://theswiftdev.com/unsafe-memory-pointers-in-swift/)
- [Swift and C interoperability](https://tech.bakkenbaeck.com/post/swift-c-interop)
- [Swift Pointers Overview: Unsafe, Buffer, Raw and Managed Pointers](https://www.vadimbulavin.com/swift-pointers-overview-unsafe-buffer-raw-and-managed-pointers/)
- [Unsafe Territory! Understanding Raw Bytes and Pointers in Swift | QuickBird Studios Blog](https://quickbirdstudios.com/blog/swift-unsafe-raw-bytes-pointers-ios/)
- [How to Dereference an Unsafe Mutable Pointer in Swift](https://useyourloaf.com/blog/how-to-dereference-an-unsafe-mutable-pointer-in-swift/)
- [Unsafe Swift: For Fun & Profit](https://academy.realm.io/posts/russ-bishop-unsafe-swift/)
- `UnsafePointer<T>` - preserve type of referenced value; can be accesed through `.pointee`; not mutable;
- `UnsafeMutablePointer<T>` - preserve type of referenced value; can be accesed through `.pointee`; mutable;
- `UnsafeBufferPointer<T>` - non-mutable typed pointer to contiguous memory;
- `UnsafeMutableBufferPointer<T>` - mutable typed pointer to contiguous memory;
- `UnsafeRawPointer` - not typed pointer to some memory
- `UnsafeMutableRawPointer`
- `UnsafeRawBufferPointer`
- `UnsafeRawMutableBufferPointer`
- `OpaquePointer` - points to some unknown type. Good for bridging with C API, becouse some C structs can't be represented in Swift.

```swift
var someArray = [1, 2, 3]
let uhOh = someArray.withUnsafeBufferPointer { ptr in 
    return ptr 
} 
// Later... 
print(uhOh[10])  
```

You should **NEVER** return a pointer from `withUnsafeBufferPointer`

## Example

```swift
var x = 20
var xPointer = UnsafeMutablePointer<Int>(&x)

// x address: 0x0000000102790080
print("x address:", UnsafeRawPointer(&x))
// x value: 20
print("x value:", x) 
// pointer address: 0x0000000102790088
print("pointer address:", UnsafeRawPointer(&xPointer))
// pointer reference: 0x0000000102790080 (same as x address)
print("pointer reference:", xPointer)
// pointer reference value: 20
print("pointer reference value:", xPointer.pointee)

// x value: 420
// pointer reference value: 420
xPointer.pointee = 420
print("x value:", x)
print("pointer reference value:", xPointer.pointee)

// x value: 69
// pointer reference value: 69
x = 69
print("x value:", x)
print("pointer reference value:", xPointer.pointee)
```

```swift
var array = [1, 2, 3, 4, 5]
let element = array.withUnsafeBufferPointer { pointer in
		return pointer[0]
}
print(element) // 1
```