- **Links**
	- [The cron schedule expression editor](https://crontab.guru/#*_*_*_1-12_*)
- **Notes**
	- make sure that script that you want add to job is executable (have an `+x` flag)
	```bash
	# edit cron jobs
	crontab -e 

	# list all cron jobs
	crontab -l
	```
	```bash
	# backup cron jobs
	crontab -l > ~/.dotfiles/config/cronetab/crontetab.txt
	```
