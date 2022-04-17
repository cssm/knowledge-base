# Modules import

```
- rdir/
	- m1.py
	- folder/
		- m2.py
```

```python
# in m2.py
from .m1 import *
```

only works with packages