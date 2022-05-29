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