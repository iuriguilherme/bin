#!/bin/bash
SRC="${HOME}/git/gnu-social/*"
DST="${HOME}/www/tortuga/"

sudo rsync -r ${SRC} "${DST}/"
sudo chown -hR www-data "${DST}"
sudo chmod g+w "${DST}"

for DIR in avatar background file
do
	sudo chmod g+w "${DST}/${DIR}"
done

