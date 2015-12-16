#!/bin/bash
## Este script serve para adicionar vários remotes em um repositório GIT.
## Não importa qual é o 'origin' ou 'upstream', este script cria remotes novos.

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

