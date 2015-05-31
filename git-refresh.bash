#!/bin/bash
## Este script serve para atualizar todos reposit√rios git bem configurados
## O que n√o tiver configruado com `git branch --set-upstream` n√o vai ser atualizado

for REPO in ${HOME}/git/*
do
	if [ -d "${REPO}" ]
	then
	        pushd "${REPO}"
	        /usr/bin/git pull
		popd
	fi
done

