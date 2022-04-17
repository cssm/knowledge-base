- This command moves **HEAD** pointer.
- Before checkout you need to stash or commit all changes from last commit or they will be lost .
`**git checkout ?<HEAD> <FILE_NAME>** // discard all unstaged changes`
- **DO NOT commit if HEAD != BRANCH**
- On file level take version of file from pointed commit and stage it (all changes in file are lost)