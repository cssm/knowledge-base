```makefile
target:
	echo "hi"
	-echo "by!" # if this command fails -> continue execution of target 
	echo "world"
```