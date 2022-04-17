# Dynamic Library

Separate program from which our program loads some functions if needed by creating links to library parts (executable file not need to be recompiled if some library functionality changed)

- We can load parts of library functionality
- No need to recompile whole app if some functionality in library changed
- Faster compile time than with static libraries
- Executable size not changing

- Executable can crash due to changes in library (function not exist anymore etc.)
- Slower calls to library functions