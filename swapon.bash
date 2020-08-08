#!/bin/bash
## Ativa swap no servidor

SWAP_FILE_NAME="swapfile.swap"
SWAP_FILE_PATH="/srv/swap/"
USER=`whoami`
SIZE=1048576

if [ ! -z $1 ]
then
  let SIZE=SIZE*$1
  echo "Will create a file with ${SIZE} *kibibytes* (${1}GB)"
  if [ -d $2 ]
  then
    SWAP_FILE_PATH="${2}"
  fi
else
  echo "Defaulting to 1GB (${SIZE} kibibytes). Use $0 8 for 8GB (1 gibibyte times 8 in powers of 1024)."
fi

SWAP_FILE="${SWAP_FILE_PATH}/${SWAP_FILE_NAME}"

echo "Will use ${SWAP_FILE} as swap file."

if [ "${USER}" == "root" ]
then
  if [ ! -f "${SWAP_FILE}" ]
  then
    mkdir -p "${SWAP_FILE_PATH}"
    dd if=/dev/zero of="${SWAP_FILE}" bs=1024 count=${SIZE} status=progress
  fi
  chmod -v 600 "${SWAP_FILE}"
  mkswap -c "${SWAP_FILE}"
  swapon -v "${SWAP_FILE}"
  free -ltw
else
  echo "You are not root. GTFO."
fi

