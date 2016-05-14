#!/bin/bash
## Este script renomeia todos arquivos do diretório atual segundo o padrão fornecido com incremento numérico

NUM=0

if [ ! -z $1 ]
then
	for FILE in *
	do
		EXT=$(echo -n ${FILE} | sed -e 's/.*\.//g')
		mv ${FILE} "${1}_${NUM}.${EXT}"
		NUM=$(expr ${NUM} + 1)
	done
else
	echo "Uso: $0 <padrão>"
fi

