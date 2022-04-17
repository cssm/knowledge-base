- With code below we will get an `UnsafePointer`
	```c
	// sample.h

	typedef struct person person;

	struct person {
		int age;
		char *first_name;
	};

	void person_print(person*);
	```
- With code below we will get an `OpaquePointer`
	- `OpaquePointer` - pointer to [C](C.md) struct that not exposed to header
	- Because account is only in the header file, it's called an opaque (or sometimes: incomplete) type: from the outside, we don't know anything about it fields and how many memory it will occupy.
```c
func person_print(_: UnsafeMutablePointer<person>!)

// sample.h

typedef struct account account;

void account_print(account*);
```
