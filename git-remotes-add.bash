#!/bin/bash
## Este script serve para adicionar vários remotes em um repositório GIT.
## Não importa qual é o 'origin' ou 'upstream', este script cria remotes novos.

pushd `pwd`

ORIGIN="`git remote -v | grep -m 1 -e 'origin' | awk '{ print $2 }'`"
REMOTE_NAMES=( 'notabug' 'gitlab' 'github' )
REMOTE_URLS=( 'notabug.org' 'gitlab.com' 'github.com' )

if [ ${#REMOTE_NAMES[*]} -eq ${#REMOTE_URLS[*]} ]
then
	for REMOTE_NUM in `seq 0 \`expr ${#REMOTE_NAMES[*]} - 1\``
	do
		REMOTE_NAME="${REMOTE_NAMES[${REMOTE_NUM}]}"
		REMOTE_URL="`echo ${ORIGIN} | sed -s \"s/@[a-z.]*:/@${REMOTE_URLS[${REMOTE_NUM}]}:/g\"`"
		## Attempt to add remote, otherwise, set its url, otherwise does nothing.
		git remote add ${REMOTE_NAME} ${REMOTE_URL} || git remote set-url ${REMOTE_NAME} ${REMOTE_URL}
	done
else
	echo "Número de parâmetros incorretos, corrija o script"
fi

popd

