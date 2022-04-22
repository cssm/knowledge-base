- **Notes**
	- [Explicit Constructors](C++/C++%20Notes/Explicit%20Constructors.md)
	- [Working With Files In C++](C++/C++%20Notes/Working%20With%20Files%20In%20C++.md)
	- [Exceptions](C++/C++%20Notes/Exceptions.md)
	- [Operators overloads](C++/C++%20Notes/Operators%20overloads.md)
	- [Pointers](../../Pointers.md)
	- [Compiling](C++/C++%20Notes/Compiling.md)
	- [Iterators](C++/C++%20Notes/Iterators.md)
	- [С++ Reference vs pointer](C++/C++%20Notes/С++%20Reference%20vs%20pointer.md)
	- [Constant Methods](C++/C++%20Notes/Constant%20Methods.md)
	- [Namespaces](C++/C++%20Notes/Namespaces.md)
	- [std map](C++/C++%20Notes/std%20map.md)
	- [std string](C++/C++%20Notes/std%20string.md)
	- [std vector](C++/C++%20Notes/std%20vector.md)
	- [std optional](C++/C++%20Notes/std%20optional.md)
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