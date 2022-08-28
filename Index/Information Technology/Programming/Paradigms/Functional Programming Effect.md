- **Notes**
	- *Effect* - change of the outside world by executing some expression
		```swift
		func logOutCurrentUser() {
		 User.current = nil
		}
		```
	- *Co-effect* - state of the outside world that expression need in order to execute
		```swift
		func currenUserIsCreator(of project: Project) -> Bool {
		 User.current.id == project.creator.id
		}
		```