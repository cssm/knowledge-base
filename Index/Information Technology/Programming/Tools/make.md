- *[Python](Python.md)*
	- [Automate your Python project with Makefile](https://antonz.org/makefile-automation/)
- **Links**
	- [Makefile Tutorial by Example](https://makefiletutorial.com/#getting-started)
- **Notes**
	- *Ignoring errors from command*
	```makefile
	target:
		echo "hi"
		-echo "by!" # if this command fails -> continue execution of target 
		echo "world"
	```
	- *Suppress output*
	```makefile
	target:
		echo "kek" # this will be printentd to stdout
		@echo "lol" # this will not
	```
	- `@`, `-` etc. **can be** combined in one line
	```makefile
	target:
		@echo "hi"
		-@kill Xcode # !important! no spaces 
	```
	- `%` - in name means a `*`
	```makefile
	target: prerequisites (dependencies)
	   echo "kek"
	```
	- *Optional parameters*
	```makefile
	bind ?= localost
	port ?= 3000
	serve:
		python -m http.server dist -bind $(bind) $(port)
	```
	```shell
	# now we can call it like this
	make serve bind=192.168.0.1
	make serve port=8000
	make serve
	```