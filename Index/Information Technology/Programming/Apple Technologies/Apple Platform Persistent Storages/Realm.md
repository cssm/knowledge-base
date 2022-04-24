- **Notes**
	- `Realm()` - like context in Core Data (we work with db instaces using it)
	- `Object` - inherit class from it to make a db model
	- to create one-to-many - using property of type **Object**
	- to crate many-to-one or many-to-many - using property of type **List**	
	- Any operations in the database, like creating, editing or deleting objects, must be performed within **writes** by calling **write(_:)** on **Realm instances**.