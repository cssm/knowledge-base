> [Programming Language](../../Programming%20Languages.md) to work with text

- **Links**
	- [awk Man Page - macOS - SS64.com](https://ss64.com/osx/awk.html)
	- [Awk - A Tutorial and Introduction - by Bruce Barnett](https://www.grymoire.com/Unix/Awk.html)
	- [tdhopper/awk-lessons: An unfinished interactive Awk tutorial using Jupyter notebooks](https://github.com/tdhopper/awk-lessons)
	- 
- **Notes**
	```bash
	ps | awk '{print $0}' # print whole line
	ps | awk '{print $1}' # print first column
	ps | awk '{print $2}' # print second column
	ps | awk '{print $1, $2}' # print first and second column
	``` 