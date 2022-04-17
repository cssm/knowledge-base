# Exceptions

```cpp
// to use custom exceptions
#include <exception>
```

```cpp
throw exception(); // general exception

try {
	throw runtime_error("Some error accured");
	throw runtime_error(""); // need an empty string cause no default constructor
} catch (runtime_error& e) {
	// exception description
	std::cout << e.what() << endl; // Some error accured
}
```