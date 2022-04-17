# std::map

```cpp
#include <map>

// key-value storage (key - string, value - int)
std::map<string, int> m; // empty map
std::map<string, int> m = {{"3", 3}, {"4", 4}}; // initilized with some values
```

```cpp
// remove element by key
m.erase("some string");

// just calling [] on map cause creating new element with default value 
string s = m["5"]; // creates new element if "5" is not exist
m["5"] += 5; // same
m["kek"]++; // this can be used to count strings because if not exist creates with
						// 0 value and than += 1

// check if key exist
if (m.count(5)) {
	// key exists
} else {
	// key is not exists
}
```

```cpp
// iterate through 

// old way
for (auto& kv : m) {
	kv.first // access key
	kv.second // access value
}

// c++17 >=
for (auto& [key, value] : m) {
	key // access key
	value // access value
}
```

```cpp
void SomeFunc(const std::map<int, string>& m) {
	m[3] // error because can cause mutation if key is not exists
	m.at(3) // ok but if key is not exists - exception 
}
```