# Iterators

```cpp
vector<int> a = {1, 2, 3, 4};
auto iter = a.begin(); // it's an iterator type which just a pointer to some value in collection
vector<int>::iterator // type of iterator
cout << *iter; // 1

struct Car {
		string name;
};
  
vector<Car> cars = {{"Volvo"}, {"Bmw"}};
auto iter = cars.begin();
cout << iter->name; // Volvo
cout << (--cars.end())->name << endl; // Bmw

cars.end() // end is some value after collection, so [col.begin(), col.end())
```