#!/bin/bash
## Verifica arquivos de configuração antes de iniciar cgminer no raspberry pi

##
## Variáveis que podem ser alteradas
##
MINER_BIN="cgminer"
MINER_PATH="/usr/local/bin/${MINER_BIN}"
CONFIG_DIR="/root/.${MINER_BIN}"
CONFIG_FILE="${CONFIG_DIR}/${MINER_BIN}.conf"
CONFIG_DEFAULT="${CONFIG_DIR}/default.conf"

##
## Provavelmente não tem nada pra mudar daqui pra frente
##
CONFIG_FIND="$(find ${CONFIG_FILE} -type l -print0)"
CONFIG_SUCH="$(/bin/echo -n ${CONFIG_FIND} | /bin/grep -e 'No such file or directory')"
CONFIG_BROKEN="$(/bin/echo -n ${CONFIG_FIND} | xargs -r0 file | /bin/grep -e 'broken symbolic link')"

## Este teste é verdadeiro se o arquivo EXISTE
if [ "${CONFIG_SUCH}" == "" ]
then
	## Este teste é verdadeiro se o link simbólico está quebrado
	if [ "${CONFIG_BROKEN}" != "" ]
	then
		/bin/rm ${CONFIG_FILE}
		/bin/ln -s "${CONFIG_DEFAULT}" "${CONFIG}"
	fi
	/usr/bin/screen -dmS "${MINER_BIN}" "${MINER_PATH}" -c "${CONFIG_FILE}"
else
	if [ -f "${CONFIG_DEFAULT}" ]
	then
		/bin/ln -s "${CONFIG_DEFAULT}" "${CONFIG}"
	else
		/bin/echo "Nenhum arquivo de configuração encontrado. Verifique a existência dos mesmos."
		/bin/echo "O diretório ${CONFIG_DIR} deveria existir, com pelo menos o arquivo ${CONFIG_DEFAULT}."
	fi
fi

