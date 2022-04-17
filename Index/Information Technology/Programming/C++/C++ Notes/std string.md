# std::string

```cpp
#include <string>
```

## Convert `string` to `int`

```cpp
std::string s1 = "+21";
std::string s2 = "kek 21";
auto d1 = std::stoi(s1); // ok int d1 = 21
auto d2 = std::stoi(s1); // exception std::invalid_argument
```