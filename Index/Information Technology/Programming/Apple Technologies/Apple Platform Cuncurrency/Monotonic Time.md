- **Notes**
	- *Monotonic* - when we don't use sync with computer clock
	- *Non-monotonic* or *Wall time*
		> This means that you can save a file to the file system, then save another file to the file system, **and the second file has a time measurement earlier than the first**. In other words, an operation that happens after another operation in real time may have an earlier time!
- **Links**
	- [Measure elapsed time in Swift - Stack Overflow](https://stackoverflow.com/questions/24755558/measure-elapsed-time-in-swift)