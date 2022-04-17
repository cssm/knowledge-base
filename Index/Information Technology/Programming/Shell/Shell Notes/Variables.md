# Variables

## $ variables

```bash
echo $0 # path to file 
```

If we run some script like this `./script.sh` that `$0` will contain `./script`

If we run script like this `someDir/someOtherDir/script.sh` than `$0` will contain `someDir/someOtherDir/script.sh`

```bash
echo $1 # first param passed to the script
```

## `export` vs no export

`export SOME_VAR="kek"` - this variable is available for all subprocesses (in this case `shell` will be the parent process)

`SOME_VAR="kek"` - variable only available in shell process 

## `readonly`

makes variable `readonly` only for the curren process. 

```bash
readonly VAR="var"
```

## **`local`**

```bash
local a=“kek” # local here is a command
local b=$(cd "kek/") # will always return 0 status code even if cd "kek/" fails
```

## Transformations

```bash
# check if variable exists
${variable:?error message}

${1:?usage: $0 input_file} # if no arguments passed to script shows error "./file_name.zsh: line 3: 1: usage: ./file_name.zsh input_file" and stop executing 

# set `some_var` to `default_value` if `variable is not exist; otherwise set to `variable`
some_var=${variable:-default_value}

# trimming of strings
${var%suffix}
${var#prefix}
```