```applescript
tell application "Reminders"
    log (get name of lists)
    set myList to list "Test"
    log (get properties of myList)

    log (get name of reminders of myList)
    set myReminder to reminder "Pizza" of myList
    log (get properties of myReminder)

    set completed of myReminder to true
end tell
```