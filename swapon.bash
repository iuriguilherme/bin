#!/bin/bash
## Ativa swap no servidor

SWAP_FILE="/srv/swap/swapfile.swap"
USER=`whoami`
SIZE=1048576

if [ ! -z $1 ]
then
  let SIZE=SIZE*$1
  echo "Will create a file with ${SIZE} *bytes*"
else
  echo "Defaulting to 1GB (${SIZE} kilobytes). Use $0 8 for 8GB."
fi

if [ "${USER}" == "root" ]
then
  if [ ! -f ${SWAP_FILE} ]
  then
    mkdir -p $(dirname ${SWAP_FILE})
    dd if=/dev/zero of="${SWAP_FILE}" bs=1024 count=${SIZE}
  fi
  chmod -v 600 "${SWAP_FILE}"
  mkswap -c "${SWAP_FILE}"
  swapon -v "${SWAP_FILE}"
else
  echo "You are not root. GTFO."
fi

