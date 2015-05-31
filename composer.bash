#!/bin/bash
COMPOSER="${HOME}/lib/composer.phar"
PHP="/usr/bin/php"
ARGS="--working-dir=`pwd`"

${PHP} ${COMPOSER} ${ARGS} ${@}
