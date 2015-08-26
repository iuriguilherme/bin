#!/bin/bash
## Este script é o equivalente a utilizar o a2dissite
## É necessário ter um diretório local com os arquivos de configuração do Nginx

LOCAL_CONF="${HOME}/nginx.d/"
NGINX_CONF="/etc/nginx/"
DIR=`pwd`

pushd "${NGINX_CONF}/sites-enabled"
sudo rm "${1}"
popd

