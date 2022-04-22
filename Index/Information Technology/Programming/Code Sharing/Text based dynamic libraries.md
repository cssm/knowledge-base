For example [UIKit](../Apple%20Technologies/Apple%20Platform%20Frameworks/UIKit.md)  or [Foundation](../Apple%20Technologies/Apple%20Platform%20Frameworks/Foundation.md) is frameworks that contains dynamic libraries but they don't link directly, they link through `.tbd` 

## What it is?

Text-based `.dylib` stub, or `.tbd`, is a ***text file that contains the names of the methods without their bodies***, declared in a dynamic library . It results in a significantly **lower size** of `.tbd` compared to a matching `.dylib`. Along with method names, it contains location of the corresponding `.dylib`, architecture, platform and some other metadata.

## Example

```
--- !tapi-tbd-v3
archs:           [ x86_64 ]
uuids:           [ 'x86_64: 6FFAC142-415D-3AF0-BC09-336302F11934' ]
platform:        macosx
install-name:    /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libQuadrature.dylib
objc-constraint: none
exports:         
  - archs:           [ x86_64 ]
    allowable-clients: [ vecLib ]
    symbols:         [ _quadrature_integrate ]
...
```