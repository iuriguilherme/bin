#!/bin/bash
## Este script é o equivalente a utilizar o a2disconf
## É necessário ter um diretório local com os arquivos de configuração do Nginx

LOCAL_CONF="${HOME}/nginx.d/"
NGINX_CONF="/etc/nginx/conf.d/"

pushd "${NGINX_CONF}"
sudo rm "${1}"
popd

