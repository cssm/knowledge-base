# Run Script Phase

## Variables

```bash
$SRCROOT # folder of .xcproj
$DERIVED_FILE_DIR # derived data folder location 
```

## Input files

If all files listed in this secion is not modified - script phase is not executed

```bash
echo $SCRIPT_INPUT_FILE_COUNT # number of input files in phase
echo $SCRIPT_INPUT_FILE_<0..<COUNT> # access any of input files
```

We can also list directory as input file. If any change happend in this directory (file modify, amount of files etc.) - [Xcode](Xcode.md) will run script 

## Output files

If all listed files here exist - script phase not executed

```bash
echo $SCRIPT_OUTPUT_FILE_COUNT # number of ouput files in phase
echo $SCRIPT_OUTPUT_FILE_<0..<COUNT> # access any of output files
```

## Resources

[Speeding Up Custom Script Phases](https://indiestack.com/2014/12/speeding-up-custom-script-phases/)