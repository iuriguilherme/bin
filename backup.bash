#!/bin/bash

if [ ! -z $2 ]
then
  SOURCE_PATH="$(dirname $1)"
  SOURCE_DIR="$(basename $1)"
  DEST_PATH="$(dirname $2)"
  DEST_FILE="$(basename $2).tar.xz"
  XZ_OPT=-e9 ionice -c 2 -n 7 nice -n 19 tar -cJhvpnS -C "${SOURCE_PATH}" "${SOURCE_DIR}" -C "${DEST_PATH}" -f "${DEST_FILE}"
else
  echo "Usage: $0 /caminho/completo/do/diretorio/a/ser/comprimido /caminho/pro/arquivo-final"
fi

