- **Links**
	- [regex101: build, test, and debug regex](https://regex101.com/)
	- [RegExr: Learn, Build, & Test RegEx](https://regexr.com)
	- [Regex Learn - Step by step, from zero to advanced.](https://regexlearn.com)
	- [Debuggex: Online visual regex tester. JavaScript, Python, and PCRE.](https://www.debuggex.com)
	- [GitHub - ziishaned/learn-regex: Learn regex the easy way](https://github.com/ziishaned/learn-regex)
	- [pemistahl/grex: A command-line tool and library for generating regular expressions from user-provided test cases](https://github.com/pemistahl/grex)
	- [Regex Crossword](https://regexcrossword.com)
	- [The Regex Coach - interactive regular expressions](http://www.weitz.de/regex-coach/)
	- [Regex Tutorial - Named Capturing Groups - Backreference Names](https://www.regular-expressions.info/named.html)
- **Notes**
	- To match any whitespace character use `\s` 
		- equivalent to `[ \t\n\r\f\v]` 
		- [Extended regular expressions. Search for `:class:`](https://www.gnu.org/software/bash/manual/bash.html)
			- in [Bash](Shell/Bash.md)  instead of `\s` use `[[:space:]]`
			- to match `space` or `tab` use `[[:blank:]]`
	-  Match group
		```
		v1.6.5-alpha
		```

		```
		^v[0-9]+\.[0-9]+\.[0-9]+.*
		```

		```
		^v([0-9]+\.[0-9]+\.[0-9]+).*
		```
