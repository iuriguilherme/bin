#!/bin/bash
## Este script serve para atualizar todos os sites da iiKB
## Isto é necessário porque o servidor web não tem acesso a git externo

for REPO in ${HOME}/git/*
do
	if [ -d "${REPO}" ]
	then
	        pushd "${REPO}"
		rsync -aP . www:git/`basename ${REPO}`
		popd
	fi
done

