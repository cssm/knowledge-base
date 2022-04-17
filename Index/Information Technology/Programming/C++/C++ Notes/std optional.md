# std::optional

```cpp
#include <iostream>
#include <optional>

using namespace std;

optional<int> check(bool kek) {
    if (!kek) {
        return {};
    }
    return kek + 3;
}

auto create(bool b) {
    return b ? optional<string>{"Godzilla"} : nullopt;
}

int main() {
    {
        auto lol = check(true);
        if (lol) { // or if (lol.has_value())
            cout << lol.value() << endl; // get value from optional
            cout << *lol << endl; // same 
        } else {
            cout << "NOPE" << endl;
        }
    }
    {
        auto lol = check(false);
        cout << lol.value_or(42) << endl; // 42
    }
    {
        auto str = create(false);
        if (str) {
            cout << "create(true) returned " << *str << '\n';
        } else {
            cout << *str; // nullopt is ignored 
        }
    }
    return 0;
}
```