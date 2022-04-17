```objectivec
// Create pointer to object
MyPoint *point;

// Allocate memory for this object
point = [MyPoint alloc];

// Inicilize this object 
point = [point init];

// or short syntax
MyPoint *point = [[MyPoint alloc] init];

// or even nicer 
MyPoint *point = [MyPoint new]; 

// `new` method allocates memory and inicilize object

// init

- (id)init {
    self = [super init];
    if (self) {       // perform all inicialization here        
    }
    return self;
}
```