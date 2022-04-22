## **Variables**

### Quoting Variables

[Different Type Of Quotes in Bash](Different%20Type%20Of%20Quotes%20in%20Bash.md)

Need to double quote them (i.e. not `$var` but `“$var”`) to prevent splitting it by spaces

If arguments need to expanded [Glob](Glob.md)  (e.g. to loop over them) do not quote part with /*

`"$HOME/$dir/src/*.c"` will not expand, but `"$HOME/$dir/src"/*.c` will

```bash
echo "This $variable is quoted $(but this $variable is not)"
echo "This $variable is quoted $(and now this "$variable" is too)"
```

### `$()`

starts a new context so need to quoted one more time

`$()` - means run this command and put it’s output here

Command runs in sub[Shell](Shell.md) 

### `${}`

```bash
echo "Today is $(date). A fine day." 

`${}` - is used to determenate where variable is started e.g

echo "${var}text" # trying to echo variable `var`
echo "$vartext" # trying to echo variable `vartext`
```

Also used to check if variable exists

## Arrays

Spaces instead of , 

```bash
EXT_TO_BE_RENAMED=("png" "svg" "pdf")
```

Check if array contains element

```bash
# elements of array implicitly concatenated here
if [[ "${EXT_TO_BE_RENAMED[@]}" =~ $element ]]; then echo "CONTAINS"; fi
```

**Return from function**

kek() {	return 1

}

```

kek

local result=$? # gets return code of last runner function

echo $result

fun1(){

return 34

}

```

```

fun2(){

local res=$(fun1)

echo $? # <-- Always echos 0 since the 'local' command passes.

res=$(fun1)

echo $?  #<-- Outputs 34

}

```

**Printing values**

**printf**

Difference to echo:

- Can fail (not always return 0 status code)
- Allows to add more formatting to string like in C

**echo**

- Enable interpretation of backslash escapes (special characters):

echo -e "Column 1\tColumn 2"

**Colored output**

Bash, the escape character can be obtained with the following syntaxes:

- \e
- \033
- \x1B

GREEN="\033[32m"

PURPLE="\033[95m"

RED="\033[31m"

COLOR_RESET="\033[0m”

echo -e "${GREEN}✅ DONE${COLOR_RESET}"

## eval

Evaluates command is the string 

```bash
foo=10 
x=foo
y='$'$x
echo $y # $foo
eval y='$'$x
echo $y # 10
```