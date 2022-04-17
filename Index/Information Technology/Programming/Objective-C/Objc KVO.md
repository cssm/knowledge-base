# KVO

Object will be KVO compliant if it inherit from ***NSObject***

To create observation of some property you should perform next steps:

**`// 1 Register (message send to observable)`**

`addObserver:forKeyPath:options:context`

**`// 2 Impement observing in observer`**

`observeValueForKeyPath:ofObject:change:context:`

**`// 3 Unregister (message send to obseravle)`**

`removeObserver:forKeyPath:`

When we implement ***observeValueForKeyPath:ofObject:change:context:*** we should pass unrecognized contexts to super

To force KVO for notification on some property (in case we implement our own getter/setters or work with ivars directly) we can call next methods:

`willChangeValueForKey:` `didChangeValueForKey:`