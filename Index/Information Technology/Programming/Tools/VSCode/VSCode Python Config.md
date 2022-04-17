# Python

# Fix opening new terminals on every run

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python: Current File",
            "type": "python",
            "request": "launch",
            "program": "{file}",
            "console": "internalConsole" // use internalConsole
        }
    ]
}
```