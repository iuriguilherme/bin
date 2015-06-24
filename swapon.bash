#!/bin/bash
## Ativa swap no servidor

SWAP_FILE="/srv/swap/swapfile.swap"
USER=`whoami`

if [ "${USER}" == "root" ]
then
	mkswap -c "${SWAP_FILE}"
	chmod -v 600 "${SWAP_FILE}"
	swapon "${SWAP_FILE}"
fi

