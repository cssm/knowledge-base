> body of `target` should always be indented with tab not spaces

> we can define `target` with no body `all: target1 target2 target3`

- `target` - name of the target
- `prerequisites1 prerequisite2` (dependencies) - targets to run before running `target`
```makefile
target: prerequisite1 prerequisite2 
	echo "kek"
```
-  if directory already contains file with name `target` then when you run `make target` it'll print `make: target is up to date.` (in case of 0 dependencies)
-  if `target` have any dependency that never create file with name of this dependency than `target` will always run.
	```makefile
	some_file: other_file
		echo "Run always"
		touch some_file

	other_file:
		echo "Nothing"
	```
- In other cases run of any `target` only depends on existents of file with name `target` in the directory
- *Multiple targets* 
	- `$@` here is from [Makefile automatic variables](Makefile%20automatic%20variables.md)
	```
	all: f1 f2

	f1 f2:
		echo $@
	# Equivalent to:
	# f1:
	#	 echo f1
	#
	# f2:
	#	 echo f2
	```