```bash
echo 'hello world' # hello world
echo 'hello\nworld' # hello\nworld
echo '$(whoami)' # $(whoami)
echo 'say 'hello'' # error, single quotes can't contain single quotes
```

`$''` allows escaping (`\t`, `\n`, etc.)

```bash
echo $'hello world' # hello world
echo $'hello\nworld' # hello
					 # world
echo $'$(whoami)' # $(whoami)
echo $'say 'hello'' # error, single quotes can't contain single quotes
```

```bash
echo "hello world" # hello world
echo "hello\nworld" # hello\nworld
echo "$(whoami)" # japanese_goblinn
echo "\$(whoami)" # $(whoami)
echo "say 'hello'" # say 'hello'
```

`$""`  - This is effectively the same as double quotes, however, is used for localization support

`Backtricks` is the same as `$()`
```bash
echo hello $(whoami) # hello japanese_goblinn
echo hello `whoami` # hello japanese_goblinn
```