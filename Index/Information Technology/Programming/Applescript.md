- By default created with `Mac Roman` encoding (for example`touch script.applescript`)

## Functions

They called `AppleScript Handlers` and starts with `to` or `on` keyword

```
on displayError()
    display dialog "The script encountered a problem."
end displayError

to displayError()
    display dialog "The script encountered a problem."
end displayError
```

## Check if app is running

[https://twitter.com/nebelch/status/1423740067260997635?s=12](https://twitter.com/nebelch/status/1423740067260997635?s=12)

## Show notification

```bash
osascript -e "display notification \"Собираю ${PRODUCT_MODULE_NAME}\" with title \"Xcode\""
```