Use stash to save unfinished work (because when you want to switch branches git force you to do something with edited files) that you don’t want to commit (I hope you don’t).

It will save state of your files in some kind of stack.

You can then apply this state even on another branch (be careful because it can lead to some conflicts).

**git stash (git stash push)** // command for stashing

**git stash list** // show all stashes

**git stash apply** // apply last stash

**git stash apply stash@{2}** // apple 2nd stash

**git stash apply --index** // try to restore stash with adding previosly staged files to index (if you don't than all files will be marked as "not staged for commit")

Apply command only tries to apply the stash changes but doesn’t drop this changes from stash.

**git stash drop** // drop last stash

**git stash pop** // apply stash and drop

By default stash add only tracked files. If you want to add **untracked** too add **git stash -u (—**i**nclude-untracked)** flag to command

If you also want to add **ignored** files you can use flag  **git stash -a (—all)**

**git stash --patch** // to interactivly deside what to add

You can create branch from your stash (for example to test some stashed feature that can conflict with the current state of repo). Create branch with commit you were on when you stashed.

**git stash branch <branch-name>** // will drop stash if succefully applied