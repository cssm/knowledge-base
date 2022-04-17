# Void vs Unit

Most languages even if they call they type `void` it still acts like and `unit` type (e.g [[Swift]], and [other](https://en.wikipedia.org/wiki/Unit_type)). True `void` exists only in [[C++]], `C`, `C#` and `D`

- `void` can't be used as function argument
    
    ```swift
    func a(_ a: Void) { return }
    func b() { return }
    
    a(b()) // ok
    ```
    
    ```cpp
    #include <iostream>
    
    using namespace std;
    
    void lol() { return; }
    void kek(void k) { return; }
    
    int main() {
        kek(lol()); // error
        return 0;
    }
    ```
    
- `void` type can be stored somewhere while `unit` type can