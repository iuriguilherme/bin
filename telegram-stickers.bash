#!/bin/bash
## Kopimi 2015 - this file has no license to begin with
## This script converts the given image to a png format accepted by telegram's
## stickers bot (https://telegram.me/stickers).
## You need ImageMagick for this to work.

if [ ! -z $1 ]
then
	## This test whether the first argument is an image.
	if [ "`file -ib $1 | grep -e '^image/'`" != "" ]
	then
		IMAGE="${1}"
		NEW_IMAGE="`basename ${IMAGE} | sed -s 's/\.[A-Za-z]*$/\.png/'`"
		WIDTH=`identify -format %w "${IMAGE}"`
		HEIGHT=`identify -format %h "${IMAGE}"`
		## We need to know whether we have to reduce the width or the height.
		if [ ${WIDTH} -gt ${HEIGHT} ]
		then
			convert -size 512 "${IMAGE}" "${NEW_IMAGE}"
			echo "${IMAGE} converted to 512 width, automagically adjusted height. Saved to ${NEW_IMAGE}"
		elif [ ${WIDTH} -lt ${HEIGHT} ]
		then
			convert -size x512 "${IMAGE}" "${NEW_IMAGE}"
			echo "${IMAGE} converted to 512 height, automagically adjusted width. Saved to ${NEW_IMAGE}"
		elif [ ${WIDTH} -eq ${HEIGHT} ]
		then
			convert -size 512x512 "${IMAGE}" "${NEW_IMAGE}"
			echo "${IMAGE} converted to 512 width and 512 height. Saved to ${NEW_IMAGE}"
		else
			echo "I'm not sure what to do with ${IMAGE}."
		fi
	else
		echo "${1}: Not an image. Or so I decided."
	fi
else
	echo -e "Example of usage: ${0} image.png"
fi

