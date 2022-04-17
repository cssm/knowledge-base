# std::vector

```cpp
#include <vector>
```

## Check if vector contains element

```cpp
const std::vecor v = {1, 2, 3};
if (std::find(v.begin(), v.end(), 1) != v.end()) {
	// contains
} else  {
	// not contains
}
```

## Remove elements

[More C++ Idioms/Erase-Remove](https://en.wikibooks.org/wiki/More_C++_Idioms/Erase-Remove)