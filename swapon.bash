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
else
  echo "Defaulting to 1GB (${SIZE} kibibytes). Use $0 8 for 8GB (1 gibibyte times 8 in powers of 1024)."
fi

if [ -d $2 ]
then
  SWAP_FILE_PATH="${2}"
fi

SWAP_FILE="${SWAP_FILE_PATH}/${SWAP_FILE_NAME}"

echo "Will use ${SWAP_FILE} as swap file."

if [ -f "${SWAP_FILE}" ]
then
  sudo swapoff "${SWAP_FILE}"
fi
sudo mkdir -p "${SWAP_FILE_PATH}"
sudo dd if=/dev/zero of="${SWAP_FILE}" bs=1024 count=${SIZE} status=progress
sudo chmod -v 600 "${SWAP_FILE}"
sudo mkswap -c "${SWAP_FILE}"
sudo swapon -v "${SWAP_FILE}"
free -ltw

