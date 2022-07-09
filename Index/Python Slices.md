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