- **Notes**
	- [Explicit Constructors](Explicit%20Constructors.md)
	- [Working With Files In C++](Working%20With%20Files%20In%20C++.md)
	- [Exceptions](Exceptions.md)
	- [Operators overloads](Operators%20overloads.md)
	- [Pointers](Pointers.md)
	- [Compiling](Compiling.md)
	- [Iterators](Iterators.md)
	- [С++ Reference vs pointer](С++%20Reference%20vs%20pointer.md)
	- [Constant Methods](Constant%20Methods.md)
	- [Namespaces](Namespaces.md)
	- [std map](std%20map.md)
	- [std string](std%20string.md)
	- [std vector](std%20vector.md)
	- [std optional](std%20optional.md)
- **Links**
	- [C++ vtables - Part 1 - Basics | Shahar Mike's Web Spot](https://shaharmike.com/cpp/vtable-part1/)
	- [Guide to undefined behavior](https://github.com/Nekrolm/ubbook)
	- [Obscure C++ Features](http://madebyevan.com/obscure-cpp-features/)
	- [Learn C++ – Skill up with our free tutorials](https://www.learncpp.com/)
	- [Learn Contemporary C++ | Concise&Visual Examples | hacking C++](https://hackingcpp.com/)
	- [salmer/CppDeveloperRoadmap: Roadmap for learning the C++ programming language for beginners and experienced devs.](https://github.com/salmer/CppDeveloperRoadmap)
	- [fmtlib/fmt: A modern formatting library](https://github.com/fmtlib/fmt)
- **Style Guide**
	```cpp
 	template <typename T>
	void PrintVector(const vector<T>& v) {
		for (const auto& e : v) 
			cout << e << " ";
		cout << "\n";
	}

	void Reverse(vector<int>& v) {
		auto v_copy = v;
		v.clear();
		for (int i = v_copy.size() - 1; i >= 0; --i) {
			v.emplace_back(v_copy[i]);
		}
	}
	```