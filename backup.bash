#!/bin/bash

if [ ! -z $2 ]
then
  SOURCE_PATH="$(dirname $1)"
  SOURCE_DIR="$(basename $1)"
  DEST_PATH="$(dirname $2)"
  DEST_FILE="$(basename $2).tar.xz"
  XZ_OPT=-e9 ionice -c 2 -n 7 nice -n 19 tar -cJhvpnS -C "${SOURCE_PATH}" \
    "${SOURCE_DIR}" -f "${DEST_PATH}/${DEST_FILE}"
else
  cat << EOF
Usage: $0 /full/path/to/folder/to/be/compressed /path/to/output/file
The resulting file will be 'file.tar.xz' at '/path/to/output/' which is a \
compressed version of folder 'compressed' originally at \
'/full/path/to/folder/to/be/'.

For multiple files, do:
for FILE in apple banana orange; do $0 /path/to/\${FILE} \
/path/to/backup/\${FILE}
The above command will fill /path/to/backup with apple.tar.xz, banana.tar.xz \
and orange.tar.xz

If this yelds memory problems, it's because of XZ_OPT=-e9. I recommend making \
a swap partition:
[ ! -f /swap ] && sudo dd if=/dev/zero of=/swap bs=1024 count=1048576 && sudo \
chmod 0600 /swap && mkswap /swap && swapon /swap
EOF
fi

