# trap

## Using

if you send a `kill -9` to your script, it will not execute the `[[EXIT]]` trap before exiting

```bash
function func() {
	# work
}

trap func SIGINT
```

In `zsh` we can just implement `TRAP<signal_name without SIG prefix>` function

```bash
function TRAPINT() {
	# work
}
```

## Resources

[The Bash Trap Command](https://www.linuxjournal.com/content/bash-trap-command)