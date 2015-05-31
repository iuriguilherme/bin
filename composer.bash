#!/bin/bash
## Este script serve para rodar o composer.phar sem adicionar no PATH
## Utiliza-se composer.bash ao invés de composer.phar em qualquer diretóri

COMPOSER="${HOME}/lib/composer.phar"
PHP="/usr/bin/php"
ARGS="--working-dir=`pwd`"

${PHP} ${COMPOSER} ${ARGS} ${@} # Argumentos da linha de comando
