#!/bin/bash
## Atualiza IPNS para denise.matehackers.org

if [ $(hostname -f) == "denise.matehackers.org" ]
then
  ipfs name publish $(ipfs add --cid-version 1 -r -Q /var/www/denise)
fi

