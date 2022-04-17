# Named Tuples

```python
from collections import namedtuple

# Type name, type fileds
Color = namedtuple('Color', ['red', 'green', 'blue'])

color1 = Color(55, 155, 255) 
color2 = Color(red=25, green=100, blue=0)

color1[0] # 55
color1.red # 55
```