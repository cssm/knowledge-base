- **Links**
	- [A Complete Guide on Docker for Beginners](https://www.analyticsvidhya.com/blog/2021/10/a-complete-guide-on-docker-for-beginners/)
	- [Docker Cheat Sheet](https://github.com/wsargent/docker-cheat-sheet)
- **Notes**
	- **Container** - running system process in image
	- **Image** - separated file system
- [macOS](../OS's/macOS.md)
	- [abiosoft/colima: Better docker experience for macOS](https://github.com/abiosoft/colima)
	- [lima-vm/lima: Linux virtual machines, typically on macOS, for running containerd](https://github.com/lima-vm/lima)
- *Commands*
	- `docker build -t  docker-image-name .` - Create image from docker file in current directory
	- `docker images` - See all images
	- `docker ps` - All running containers
	- `docker system prune -a` - Remove unused containers
	- `docker volume prune` - Remove unused volumes
- *Images*
	- *MySQL*
		```bash
		# open mysql in container
		docker exec -it bytickets_byTickets-database_1  mysql -uroot -proot

		# run bash in container
		docker exec -it bytickets_byTickets-database_1 bash 

		# save database dump
		docker exec bytickets_byTickets-database_1 sh -c 'exec mysqldump --all-databases -uroot -p"root"' > dump.sql
		```