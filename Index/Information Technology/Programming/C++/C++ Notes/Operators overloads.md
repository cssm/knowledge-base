# Operators overloads

```cpp
// overload of output operator
// if we will not return a stream back we can only 'cout << ds' but not 'cout << ds << enld';
ostream& operator <<(ostream& s, const CustomDataStruct& ds) {
	s << ds.some_field << endl;
	return s;
}

CustomDataStruct d;
cout << d << endl; // ok 
```