#!/bin/sh

set -ex

commit_ref=${1:-release-1.7}
sunbird_devops_dir_name=sunbird-devops
if [ ! -d $sunbird_devops_dir_name ];then
    git clone https://github.com/project-sunbird/$sunbird_devops_dir_name -b $commit_ref
    exit 0
fi
cd $sunbird_devops_dir_name
git reset --hard
git clean -fd
git fetch
git checkout "$commit_ref"
get pull -X theirs
