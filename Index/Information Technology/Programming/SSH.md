- **Notes**
	```shell
	# copy file over ssh
	scp <remoteuser@remoteserver:/remote/folder/remotefile.txt> <localfile.txt>
	```
	- `open-ssh` - for client
	- `open-ssh-server` - for servers
	- `ssh-keygen` - to generate ssh keys (only for client)
	- `ssh-copy-id` - program to configure access to the server using your public key
	- > good practice to disable ssh by password and only allow ssh keys
	- *[GitHub](Tools/Git/GitHub.md)*
		- [Using multiple github accounts with ssh keys](https://gist.github.com/oanhnn/80a89405ab9023894df7)
	- *[CLI](Shell/CLI.md)*
		- [xxh/xxh: 🚀 Bring your favorite shell wherever you go through the ssh.](https://github.com/xxh/xxh)
	- *SSH key*
		- Thing after = is a comment
			- `ssh-rsa AAAAB3N....NMqKM= this_is_a_comment`
		- We can set it by using this command
			- `ssh-keygen ... -c $YOUR_COMMENT_TO_IDENTIFY_KEY`
- **Links**
	- [OpenSSH for Absolute Beginners - YouTube](https://www.youtube.com/watch?v=3FKsdbjzBcc)