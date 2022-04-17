- Pointer - a block of memory that refers to address of another block of memory
- *Size of pointer to any type of data is always 8 bytes on 64 bit machine*

```c
printf("The size of an int pointer is %ld bytes!\", sizeof(char *)); // The size of an char pointer is 8 bytes!
printf("The size of a char pointer is %ld bytes!\", sizeof(int *)); // The size of an int pointer is 8 bytes!
```

## Pointers in C

This works because we can assign an array of chars to `char*`, and array of `char*` to `char**` and etc.

```c
char c;
char* word;
char** sentense;
char*** paragraph;
...
```