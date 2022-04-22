How to write [Clean And Extendable Code](Clean%20And%20Extendable%20Code.md) in [Python](Python.md)

## Read Data From File
```python
# ❌
sizes = input()
sizes = sizes.strip()
sizes = sizes.split()

x = int(sizes[0])
y = int(sizes[1])
z = int(sizes[2])

product = x * y * z

# ✅
product = reduce(labmda a, b: a * b, map(int, input().strip().split()))
```

## Reverse list using slices
```python
l = [1, 2, 3, 4, 5]
print(l[::-1]) # 5, 4, 3, 2, 1
```

## Better multiples conditions checking
```python
name = "A"

# ❌
if name == "A" or name == "B" or name == "C":
	print(name)

# ✅
if name in ("A", "B", "C"): print(name)

c1, c2, c3, c4, c5 = True

# ❌
if c1 and c2 and c3 and c4 and c5:
	print(True)

# ✅
if all((c1, c2, c3, c4, c5)): print("All true")

# ❌
if c1 or c2 or c3 or c4 or c5:
	print(True)

# ✅
if any((c1, c2, c3, c4, c5)): print("Any true")
```