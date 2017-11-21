#!/bin/bash

INDEX_FILE="/var/www/html/ip/index.html"
PUBLIC_IP="$(dig +short myip.opendns.com @resolver1.opendns.com)"

echo '<!DOCTYPE HTML>' 1> ${INDEX_FILE}
echo '<html>' 1>> ${INDEX_FILE}
echo '<body>' 1>> ${INDEX_FILE}
echo -n '<p>' 1>> ${INDEX_FILE}
echo -n "${PUBLIC_HTML}" 1>> ${INDEX_FILE}
echo '</p>' 1>> ${INDEX_FILE}
echo '</body>' 1>> ${INDEX_FILE}
echo '</html>' 1>> ${INDEX_FILE}
echo 1>> ${INDEX_FILE}

