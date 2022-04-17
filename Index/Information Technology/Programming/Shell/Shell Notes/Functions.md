# Functions

## Define

```bash
kek() {
	echo "kek"
}

function kek() {
	echo "kek"
}

# one liner
# need `;` at command end
kek() { echo "kek"; } 
```

## Return value

```bash
myfunc() {
   local myresult="some value"
   echo $myresult
}

result="$(myfunc)
echo $result # some value
```

## Raising errors

Just return non zero code

```bash
myfunc() {
  return 1
}

if myfunc; then
  echo "success"
else
  echo "failure"
fi
```