# Hashtable

**Hashtable** - data structure that forms relation between key and value and key is computed by appling some **hashfunction** to object

## Hashtable vs Dictionary

Let's compare hashtable to [Dictionary](../../../Dictionary.md).

Only difference is that in case of hastable key is always computed from value and we can't access it (it's a part of hashtable abstraction), where's in dictionaries in general case key and value is indepenent (so they more like `sets` but do not have set operations)

```swift
struct Dictionary<Key: Hashable, Value> // dictionary declaration
struct HashTable<Value: Hashable> // hashtable declaration
```