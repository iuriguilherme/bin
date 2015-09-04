#!/bin/bash
## Este script serve para atualizar todos os sites da iiKB
## Isto � necess�rio porque o servidor web n�o tem acesso a git externo

for REPO in ${HOME}/git/*
do
	if [ -d "${REPO}" ]
	then
	        pushd "${REPO}"
		rsync -aP . www:git/`basename ${REPO}`
		popd
	fi
done

