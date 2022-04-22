# Run in parallel

## Parallel in script

Programs can not be canceled correctly so consider run something [Parallel in terminal](#Parallel%20in%20terminal)

```bash
some_command &
another_command &
wait # if in script 
```

## Parallel in terminal

```bash
# cancel two parallel scripts on Ctrl + C
( trap 'kill 0' SIGINT; prog0 & prog1 )
```