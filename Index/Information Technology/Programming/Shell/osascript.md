> [AppleScript](../AppleScript.md)

```bash
# Show notification
osascript -e "display notification \"Собираю ${PRODUCT_MODULE_NAME}\" with title \"Xcode\""
```

```shell
link="https://google.com"
osascript -e "tell app \"Safari\" to add reading list item \"$link\""

# better way to pass shell variable
osascript << EOF
	tell app "Safari" to add reading list item "$link"
EOF
```