#!/bin/bash
##
## Monitora serviços para garantir que estão online
## Exemplo de uso em https://iikb.org/forum/Zeronet/
## Adicionar uma linha semelhante na crontab para rodar de 5 em 5 minutos:
## */5 * * * * /home/user/bin/watchdog.bash
##
## Domínio Público igreja insurgente Kopimista Brasileira 2016-2017
## Use por conta e risco. Em caso de cagada, o problema é teu.
##

SERVICOS_ICECAST=( \
"icecast2" \
"ices2-akasha" \
"ices2-balaio" \
"ices2-cymatic" \
"ices2-lapirata" \
"ices2-theerm" \
)

SERVICOS_MEDIAGOBLIN=( \
"mediagoblin-paster" \
"mediagoblin-celeryd" \
)

SERVICOS_WEB=( \
"nginx" \
"apoio" \
"zeronet" \
"ipfs" \
"tor" \
)

SERVICOS_CRYPTO=( \
"bfgminer" \
"cgminer" \
"pivx" \
"libraryd" \
"florincoin" \
)

## Comentar serviços que não estejam no servidor é opcional para diminuir o spam de erros nos logs do sistema
SERVICOS=( \
"${SERVICOS_ICECAST[@]}" \
"${SERVICOS_MEDIAGOBLIN[@]}" \
"${SERVICOS_WEB[@]}" \
"${SERVICOS_CRYPTO[@]}" \
)

if [ "$(whoami)" == 'root' ]
then
	for SERVICO in "${SERVICOS[@]}"
	do
		/bin/systemctl is-active "${SERVICO}".service || /bin/systemctl start "${SERVICO}".service
	done
else
	echo "Script de gente grande é só pra super vacas."
fi

