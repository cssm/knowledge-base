# Namespaces

```cpp
#include <iostream>

namespace kek {

    namespace kekus {
        void kekus() {
            std::cout << "ssss";
        }
    }

    void print() {
        std::cout << "kek" << std::endl;
    }
}

namespace lol {
    void print() {
        std::cout << "lol" << std::endl;
    }
    void lol() {
        std::cout << "lol1" << std::endl;
    }
}

int main() {
    {
        using namespace kek;
        print(); // kek
    }

    {
        using kek::print, lol::lol;
        print(); // kek
        lol(); // lol1
    }

    {
        namespace n = kek::kekus;
        n::kekus();  // ssss
    }
}
```