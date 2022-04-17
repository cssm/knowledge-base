- *Dependency* 
	- [newren/git-filter-repo: Quickly rewrite git repository history (filter-branch replacement)](https://github.com/newren/git-filter-repo)
- *Code*
	```bash
	#!/bin/bash

	set -eu

	TARGET_REPO=${1:?"Need to pass target repo path as first argument"}
	(cd "$TARGET_REPO" && git filter-repo --force --to-subdirectory-filter "${PWD##*/}")
	git fetch "$TARGET_REPO" master
	git merge --no-edit --allow-unrelated-histories FETCH_HEAD
	```
- *Usage*
	```bash
	cd monorepo/
	../../merge_in_monorepo.sh path_to_target_repo/
	```