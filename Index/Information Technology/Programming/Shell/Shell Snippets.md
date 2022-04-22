## Print current folder name

```bash
echo "${pwd##*/}"
```

## Shortcuts

```bash
crtl + l # clear screen
$! # last history argument
!! # last history command
```

## Subshells

```bash
# do something in current dir
(cd /some/other/dir && other-command)
# continue in original dir
```

## Variables with local scope

```bash
print_stuff() {
	  local x=$(asdf) # never fails even if asdf is not exist
		local x
		x=$(asdf) # this fails if asdf is not exist
}
```

## Multiline scripts call

```bash
some_script param \
	--another-param="kek" \
	--and-another-param="lol"
```

## Check if command exist

```bash
INSTALLED=$([ `command -v command-or-path` 2>/dev/null ] && echo true || echo false)

if $INSTALLED; then
	echo "Installed"
fi
```

## Get absolute path to directory/file

```bash
# get full path to dir where file/dir located
echo $(cd "$(dirname "$1")" && pwd -P)

# get full path to file/dir
echo "$(cd "$(dirname "$1")" && pwd -P)/$(basename $1)"
```

## Get script name from shell loading files

```bash
# in zsh
echo ${(%):-%N}  # %N indicates "The name of the script, sourced file, or shell function that zsh is currently executing
# or
echo ${(%):-%x} 

# in bash
echo ${BASH_SOURCE[0]}
```

## Allow only [Importing scripts](Shell%20Notes/Importing%20scripts.md)  but not run

works if script is marked with bash [Shebang](Shell%20Notes/Shebang.md) 

```bash
if [ "${BASH_SOURCE[0]}" -ef "$0" ]; then
	echo "Hey, you should source this script, not execute it!"
  exit 1 
fi
```