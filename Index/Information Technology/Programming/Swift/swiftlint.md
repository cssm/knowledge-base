- **Notes**
	- Amazing linter for [Swift](Swift.md) code
	- Create a `.swiftlint.yml`  in project root + add to script phase in xcode
	- *Disabling rules from code*
	```swift
	// we can disable rules by adding
	// swiftlint:disable <rule1> [<rule2> <rule3>...]

	// rules will be disabled until file end or until next comment
	// swiftlint:enable <rule> [<rule2> <rule3>...]

	// disable all rules
	// swiftlint:disable all

	// disable only for next line
	// swiftlint:disable:next all

	// disable for current line
	// swiftlint:disable:this force_cast

	// for previous line
	// swiftlint:disable:previous force_cast
	```
	- *Config*
	```yaml
	reporter: "xcode" # can report into file or right into xcode

	included: # be default includes all folders so we can ommit this
		- ...

	excluded: # do not lint this folders
	  - Pods/
		- ...

	disabled_rules: # list of rules to disable
		- ...

	# rules for swiftlint analyze (we can detect unused imports for example)
	analyzer_rules:
		- ...

	# customize rules
	force_cast:
		severity: warning # force_cast will show warning instead of build error

	# or
	force_cast: warning

	# we can even create our own rules
	custom_rules:
	  some_rule:
			included: ".*\\.swift"
	```
- **Links**
	- [GitHub - realm/SwiftLint: A tool to enforce Swift style and conventions.](https://github.com/realm/SwiftLint)
	- [swiftlint rules](https://realm.github.io/SwiftLint/rule-directory.html)

