 - *Snippets* 
	- Rename file on case-insensitive systems (`UNIX`-like)
		- `git mv readme.md README.md`
	- Remove from remote everything that not match with local    
		- `git push --force-with-lease origin $BRANCH`
	- Remove file only from git
		 - `git rm --cached <file>`
- **Notes**
	- [Git Attributes](Git%20Attributes.md)
	- [Git Hooks](Git%20Hooks.md)
	- [Learning Git](Git/Learning%20Git.md)
	- [gitignore](Git/gitignore.md)
	- [Forking](Git/Forking.md)
	- [Git LFS](Git/Git%20LFS.md)
	- [Submodules](Git/Submodules.md)
	- [Stashing](Git/Stashing.md)
	- [How to add empty directories to index](Git/How%20to%20add%20empty%20directories%20to%20index.md)
	- [git flow](Git/git%20flow.md)
	- [git reset vs checkout vs revert](Git/git%20reset%20vs%20checkout%20vs%20revert/git%20reset%20vs%20checkout%20vs%20revert.md)
	- [Merge & Rebase](Git/Merge%20&%20Rebase.md)
	- [HEAD~ and HEAD^](Git/HEAD~%20and%20HEAD^.md)
	- [[Git] Merge in monorepo]([Git]%20Merge%20in%20monorepo.md)
- **Links**
	- [pluralsight/git-internals-pdf: PDF on Git Internals](https://github.com/pluralsight/git-internals-pdf)
	- [Get up to speed with partial clone and shallow clone | The GitHub Blog](https://github.blog/2020-12-21-get-up-to-speed-with-partial-clone-and-shallow-clone/)
	- [Make your monorepo feel small with Git’s sparse index | The GitHub Blog](https://github.blog/2021-11-10-make-your-monorepo-feel-small-with-gits-sparse-index/)
- *Learning*
	- [pcottle/learnGitBranching: An interactive git visualization and tutorial. Aspiring students of git can use this app to educate and challenge themselves towards mastery of git!](https://github.com/pcottle/learnGitBranching)
- *Guidelines*
	- Often small commits
	- Instead of commit half done work use git stash
	- Use branches
	- Use this  [Conventional Commits](Git/Conventional%20Commits.md)
- *Commands*
	- [git checkout](Git/git%20checkout.md)
	- [git reset](Git/git%20reset.md)
	- [git describe](Git/git%20describe.md)
	- [git reflog](Git/git%20reflog.md)
	- [git gc](Git/git%20gc.md)
	- [git remote](Git/git%20remote.md)