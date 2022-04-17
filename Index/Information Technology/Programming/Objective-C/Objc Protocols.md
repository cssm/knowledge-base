# Protocols

# Protocols

![[Protocols/Parent_protocol_name.png]]

`// Protocol variable creation`

`id<SomeProtocol> object = [[MyClass alloc] init];`

![[Protocols/Define_protocol_variable.png]]

First expression checks if our class is implementing protocol. It’s done by simply checking header file of our class. Returns ***YES*** if implements and ***NO*** if don’t.

Second expression let us check if our class implementing some method. This is necessary because methods in protocols can be optional.

![[Protocols/Make_sure_class_conforms_to_protocol.png]]