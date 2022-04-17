# Working with files

```python
with open("test.txt") as file_handler: 
    for line in file_handler:     
        print(line)
```

## Open modes

---

`r` - reading mode

`rb` ****- bite read

`w` - on write mode (creates if not exist, rewrite if exist)

`wb` - bite write

`a` - append to file

`r+` - read and write

## Methods

---

```python
with open("test.txt") as file:
		file.read() # read all
		file.read(3) # read 3 lines
		file.readlines() # read all file line by line in list
		file.readline() # returns one string from file
		file.tell() # current position in file
		file.seek(pos) # start reading from this position
		file.write(str()) # write
```