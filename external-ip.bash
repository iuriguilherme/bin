#!/bin/bash
## Writes external ip into a html file

PUBLIC_IP="$(dig +short myip.opendns.com @resolver1.opendns.com)"

INDEX_FILE="/var/www/html/ip/index.html"
if [ ! -z $1 ]
then
  INDEX_FILE="${1}"
fi
if [ ! -f ${INDEX_FILE} ]
then
  mkdir -p $(dirname ${INDEX_FILE})
  touch ${INDEX_FILE}
fi

echo '<!DOCTYPE HTML>' 1> ${INDEX_FILE}
echo '<html>' 1>> ${INDEX_FILE}
echo '<body>' 1>> ${INDEX_FILE}
echo -n '<p>' 1>> ${INDEX_FILE}
echo -n "${PUBLIC_IP}" 1>> ${INDEX_FILE}
echo '</p>' 1>> ${INDEX_FILE}
echo '</body>' 1>> ${INDEX_FILE}
echo '</html>' 1>> ${INDEX_FILE}
echo 1>> ${INDEX_FILE}

