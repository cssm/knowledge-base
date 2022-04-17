# Constant Methods

```cpp
struct Point {
	double x;
	double y;
	
	double GetX() {
		return x;
	} 
	
	double GetY() {
		return y;
	}
};

void Print(const Point& p)  {
	auto x = p.GetX(); 
	auto y = p.GetY(); 
	cout << "X: " << x << " Y:" << y << "\n"; 
}

int main() {
	Print({10, 2}); // error
	return 0;
}
```

Compiler can't guarantee that `Print` method won't mutate our constant reference to `Point p` because this method calls `GetX and GetY` that have posobility of mutation

To solve this problem we have `constant methods`

```cpp
struct Point {
	double x;
	double y;
	
	double GetX() const {
		return x;
	} 
	
	double GetY() const {
		return y;
	}
};

void Print(const Point& p)  {
	auto x = p.GetX(); 
	auto y = p.GetY(); 
	cout << "X: " << x << " Y:" << y << "\n"; 
}

int main() {
	Print({10, 2}); // ok
	return 0;
}
```

It's important to notice that `constant methods` can call only other constant methods 

Also important that on `constant reference` we can call **only constant methods**, but on regular reference we can call **any method** - constant or regular