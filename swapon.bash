#!/bin/bash
## Ativa swap no servidor

SWAP_FILE="/srv/swap/swapfile.swap"
USER=`whoami`
SIZE=1048576

if [ ! -z $1 ]
then
  let SIZE=SIZE*$1
  echo "Will create a file with ${SIZE} *kibibytes*"
else
  echo "Defaulting to 1GB (${SIZE} kibibytes). Use $0 8 for 8GB (1 gibibyte times 8 in powers of 1024)."
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
  free -ltw
else
  echo "You are not root. GTFO."
fi

