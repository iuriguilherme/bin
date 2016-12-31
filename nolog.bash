#!/bin/bash
##
## Apaga logs do sistema, em desobediência ao artigo 15 do marco civil
## Mais informações: https://iikb.org/tutorial/Apagar_logs_no_Linux/
##
## Domínio Público igreja insurgente Kopimista Brasileira 2016
##

## Trabalho em progresso, quem tiver mais caminhos de arquivos de log padrão pra providenciar, sinta-se à vontade.
LOGS=( \
"/var/log/nginx/access.log" \
"/var/log/nginx/error.log" \
)

for LOG in ${LOGS[@]}
do
        echo 1> "${LOG}" # Foda-se o artigo 15 do marco civil
        # Foda-se o artigo 15 do marco civil de novo
done
# E caso a mensagem não tenha ficado clara, foda-se essa porra de artigo 15 do marco civil

