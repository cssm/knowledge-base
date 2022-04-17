# Decorators

```python
def timer(func):
    def f(x, y=10):
        func(x, y)
    return f

def add(x, y=10):
    return x + y

# instead of this
add = timer(add)

# we can write this
@timer
def add(x, y=10):
    return x + y
```