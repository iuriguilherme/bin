#!/bin/bash
## Este script é o equivalente a utilizar o a2ensite
## É necessárioter um diretório local com os arquivos de configuração do Nginx

LOCAL_CONF="${HOME}/nginx.d/"
NGINX_CONF="/etc/nginx/"
DIR=`pwd`

if [ -f "${LOCAL_CONF}/${1}" ]
then
	pushd "${NGINX_CONF}/sites-available"
	sudo ln -s "${LOCAL_CONF}/${1}"
	cd ../sites-enabled
	sudo ln -s "../sites-available/${1}"
	popd
else
	echo "Vai tomar no cu"
fi

