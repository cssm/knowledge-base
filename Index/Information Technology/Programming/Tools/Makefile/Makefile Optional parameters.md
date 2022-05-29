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