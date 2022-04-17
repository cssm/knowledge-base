# Static Library

Part of executable file, so whole app need to be recompiled if we make some changes in library functionality

- Fast calls to library functions
- Executable will not crash if library functionality changed (if we don’t need new library updates)

- Need to load whole library even if we need only some functions from it
- Need to recompile whole app if some library functionality changed (if we want to get new library updates)
- Increase of executable size
- Increase of compile time