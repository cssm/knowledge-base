# @frozen

## What `@frozen` attribute needed for?

Works only with `-enable-library-evolution` (libary evolution mode) compiler param

- makes type mark with this attribute `ABI Stable`
    - 
- allows to compiler to optimize some operation at compile time
    - for example instead of indirect calls make direct
- restricts changing API of struct

## References

[](https://forums.swift.org/t/pitch-library-evolution-for-stable-abis/23026)