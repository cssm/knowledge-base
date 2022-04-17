# Garbage Collection

Compared to MRR, ARC has moved memory management from being imperative to being declarative.

Reference count VS garbage collection (mark and sweep):

- mark and sweep needs 3x-4x more memory to work efficient
- mark and sweep less battery efficient
- reference count allows Swift to be used in live video processing tools, os kernel and etc. (a lot of low level stuff)

## Resources

[https://lists.swift.org/pipermail/swift-evolution/Week-of-Mon-20160208/009422.html](https://lists.swift.org/pipermail/swift-evolution/Week-of-Mon-20160208/009422.html)