- [Makefile automatic variables](Makefile%20automatic%20variables.md)
- variables are *always strings*
```makefile
# Both valid syntax do define variable
variable1 = file1 file2
variable := file1 file2

target:
	# syntax to read a variable
	echo $(variable)
	echo ${variable}
	echo $varibale # bad practice 
``` 