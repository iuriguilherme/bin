#!/bin/bash
## Este script serve para dar push a todos remotes configurados em um repositório GIT.

pushd `pwd`

REMOTES="`git remote -v | grep -e 'push' | awk '{ print $1 }'`"

BRANCH="master"

if [ ! -z $1 ]
then
	BRANCH="${1}"
fi

for REMOTE in ${REMOTES[@]}
do
	git push ${REMOTE} ${BRANCH}
done

popd

