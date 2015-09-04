#!/bin/bash
## Este script serve para atualizar todos os sites da iiKB
## Isto � necess�rio porque o servidor web n�o tem acesso a git externo

for SERVER in www lamp
do
	for REPO in ${HOME}/git/${SERVER}/*
	do
		if [ -d "${REPO}" ]
		then
		        pushd "${REPO}"
			rsync -aP . ${SERVER}:git/`basename ${REPO}`
			popd
		fi
	done
done
