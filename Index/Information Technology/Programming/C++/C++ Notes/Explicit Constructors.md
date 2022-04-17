They can add more verbosity into code

```cpp
struct Specialization {
    string value;
    explicit Specialization(string v) { value = v; }
};

struct Course {
    string value;
    explicit Course(string v) { value = v; }
};

struct Week {
    string value;
		explicit Week(string v) { value = v; }
};

struct LectureTitle {
    string specialization;
    string course;
    string week;
    LectureTitle(Specialization s, Course c, Week w) {
      specialization = s.value;
      course = c.value;
      week = w.value;
    }
};
```

So because of `explicit constructor` we need explicitly call constructor of type and this makes out code more readable 

```cpp
LectureTitle({"C++"}, {"White Belt"}, {"3"}); // error
LectureTitle(
		Specialization("C++"),
		Course("White Belt"), 
		Week("3")
); // ok
```