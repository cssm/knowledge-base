> Python Package Installer

- Save dependencies to file
	```bash
	# saves all dependencies from current venv into file
	pip freeze > requirements.txt

	# install all dependencies from file in current venv
	pip install -r requirements.txt
	```