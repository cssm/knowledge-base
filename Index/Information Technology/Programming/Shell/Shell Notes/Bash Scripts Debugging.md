```bash
set -x # prints out executed lines in format: `+ echo "smth"`
set -v # same as -x but do not print + sign
set -e # abort if error
set -u # detect unset variables usage
set -o pipefail # if any command in pipeline fails - use it error code as pipline return code
```

[Bash script with `set -e` doesn't stop on `... && ...` command](https://unix.stackexchange.com/questions/312631/bash-script-with-set-e-doesnt-stop-on-command)

```bash
set -e

# will not exit script on error if kek is not exits
cd kek && echo "lol"

# will not exit script on error if kek is not exits
cd kek || echo "lol"
```