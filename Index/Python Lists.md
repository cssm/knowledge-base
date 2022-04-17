- **Links**
	- [How Python list really works](https://antonz.org/list-internals/)
- **Notes**
	- *Slices*
	```python
	l = [1, 2, 3, 4]
	l_copy = l
	l_copy.append(5)
	print(l, l_copy) # [1, 2, 3, 4, 5] [1, 2, 3, 4, 5]

	l = [1, 2, 3, 4]
	l_copy = l[:]
	l_copy.append(5)
	print(l, l_copy) # [1, 2, 3, 4] [1, 2, 3, 4, 5]
	```
	- *Comprehension*
	```python
	l = [i for i in range(5)] # 0 1 2 3 4

	gen_obj = (i for i in range(3))
	for i in gen_obj:
		print(i)
	# 0 1 2
	```