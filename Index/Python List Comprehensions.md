```python
	l = [i for i in range(5)] # 0 1 2 3 4

	gen_obj = (i for i in range(3)) # this creates iterator instead
	for i in gen_obj:
		print(i)
	# 0 1 2
	```