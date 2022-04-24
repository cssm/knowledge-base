- **Notes**
	```bash
	cat somefile.txt | tail # pipe
	tail <<(cat somefile.txt) # aternative to pipe
	```
	-  `stdin`, `stdout`, `stderr`
		- Under the hood all of them are *file descriptors*- unsigned number that identify opened file
		- `stdin` || Standard input || `0` descriptor
			- The default data stream for input, for example in a command pipeline. In the terminal, this defaults to keyboard input from the use
		- `stdout` || Standard output || `1` descriptor
			- The default data stream for output, for example when a command prints text. In the terminal, this defaults to the user's screen
		- `stderr` || Standard error || `2` descriptor
			- The default data stream for output that relates to an error occurring. In the terminal, this defaults to the user's screen
- **Links**
	- [Fun with Redirection](https://christine.website/blog/fun-with-redirection-2021-09-22)

### Ignore error output

```bash
# stderr to "nowhere" aka /dev/null 
find / -name '*something*' 2>/dev/null
```

### Reading/writing to the stream

```bash
# when we read from stream
echo > file1.txt 2>file2.txt
echo 1>file1.txt 2>ile2.txt # same

# when we write into stream
echo "kek"
echo "kek" >&1 # same
echo "kek" >&2 # into stderr
```