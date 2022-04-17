# Make text bold

```bash
bold=$(tput bold)
normal=$(tput sgr0)

# use
echo "this is ${bold}bold${normal} but this isn't"

# another way
echo -e '\033[1mYOUR_STRING\033[0m'
```

If we use this we need to specify text color ourself i.e. text will be always white even on light terminal theme