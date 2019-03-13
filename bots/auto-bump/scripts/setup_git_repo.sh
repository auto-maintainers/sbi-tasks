#!/bin/bash

# Update user fork
rm -rf /root/repo || true
git clone $FORK_REPO /root/repo
cp storage/create_pr.sh /create_pr.sh

cd /root/repo
git remote add upstream $UPSTREAM_REPO
git fetch --all
git reset --hard upstream/master
git push -fv
git branch -D $WORK_BRANCH || true
git checkout -b $WORK_BRANCH
git reset --hard upstream/master
git push -fv -u origin $WORK_BRANCH

