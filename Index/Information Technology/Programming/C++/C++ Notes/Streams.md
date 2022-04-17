# Streams

```cpp
// cin cout
#include <iostream>
```

```cpp
// file streams inhereted from iostream
#include <fstream>

// read from file (ihereted from istream)
ifstream s("file.txt");

// write to file (ihereted from ostream)
ofstream s("file.txt");
ofstream s("file.txt", ios::app); // append to file

// read and write to file (ihereted from iostream)
fstream s("file.txt");

// checks if file is opened correctly
if (s.is_open()) {}

string ss;
// read strings from while to the end
while (getline(s, ss)) {}

// read until some char, by default to '\n'
getline(s, ss, ' ');

// if we need to read int, double etc.
int i;
s >> i; // reads int
s.ignore(1); // skip one symbol from stream
```

```cpp
// to use stream manipulators like setw() etc.
#include <iomanip>

// manipulators that are not reseted after each ouput
cout << fixed << 3.1; // 3.100000
cout << setprecision(2) // 3.10
cout << setfill('.') // sets which char to use to fill blank spaces between items
cout << left; // align items to left of output

// resets after each output
cout << setw(2) << 3; // output width

```

## Check if right type comes from stream

```cpp
int a;
if (cin >> a) {
	// int come from cin
} else {
	// not int come from string
}
```

## `std::stringstream`

```cpp
#include <sstream>
// we can read this string like stream
string s = "Some string wow omg";
istringstream ss(s);

string some;
ss >> some; // some = "Some";

```