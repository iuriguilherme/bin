#!/bin/bash
## Inicia um serviço ices2 pré configurado

CANAL=""
ICES2="/usr/bin/ices2"

if  [ ! -z $1 ]
then
	CANAL="${1}"
	ICES2="`whereis ices2-${CANAL} | awk '{ print $2}'`"
	${ICES2} ${HOME}/ices2.d/${CANAL}-playlist.xml
else
	echo "E o parâmetro?"
fi


