#!/bin/bash
## Apaga essa porra de log

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

