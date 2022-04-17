#!/bin/bash

set -eu

TARGET_REPO=${1:?"Need to pass target repo path as first argument"}
(cd "$TARGET_REPO" && git filter-repo --force --to-subdirectory-filter "${PWD##*/}")
git fetch "$TARGET_REPO" master
git merge --no-edit --allow-unrelated-histories FETCH_HEAD