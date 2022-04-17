# C++

## Run c++ coderunnner

```json
ctrl + alt + n // run
ctrl + alt + m // abort
```

## Using lldb comands in debug console

```bash
-exec e variable
```

## launch.json

```json
{
    "version": "0.2.0",
    "configurations": [
      {
        "targetArchitecture": "x86_64",
        "name": "clang++ - Build and debug active file",
        "type": "cppdbg",
        "request": "launch",
        "program": "${fileDirname}/${fileBasenameNoExtension}",
        "cwd": "${workspaceFolder}",
        "environment": [],
        "externalConsole": true,
        "MIMode": "lldb",
        "preLaunchTask": "clang++ build active file"
      }
    ]
  }
```

## tasks.json

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "type": "shell",
            "label": "clang++ build active file",
            "command": "/usr/bin/clang++",
            "args": [
                "-std=c++17",
                "-stdlib=libc++",
                "-g",
                "${file}",
                "-o",
                "${fileDirname}/${fileBasenameNoExtension}"
            ],
            "options": {
                "cwd": "${workspaceFolder}"
            },
            "problemMatcher": [
                "$gcc"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            }
        }
    ]
}
```