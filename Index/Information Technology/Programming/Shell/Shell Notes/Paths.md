- [Filenames and Pathnames in Shell (bash, dash, ash, ksh, and so on): How to do it Correctly](https://dwheeler.com/essays/filenames-in-shell.html)
```bash
# let's say we are in ~/folder/some_folder/file.sh

cd ../ # this will go back one directory, but depending on from which dir script was run

SCRIPT_DIR_PATH="$( cd "$(dirname "$0")" && pwd )"
cd $SCRIPT_DIR_PATH/.. # guaranteed cd in some_folder/
```