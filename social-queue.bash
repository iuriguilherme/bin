#!/bin/bash
## Este script roda OportunisticQM em social.pirata.xyz

CURL=1
DOMAIN="social.pirata.xyz"
URL="https://${DOMAIN}/main/runqueue"

while [ $CURL -gt 0 ]
do
	CURL=$(curl ${URL})
done

