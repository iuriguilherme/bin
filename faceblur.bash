#!/bin/bash
## Kopimi Desobediente Civil
## Este script tenta borrar as faces das fotografias do diretório atual, ou naquele providenciado como primeiro parâmetro
## Não confie a vida nisto, verifique as fotografias posteriormente
## Kopiado do script providenciado em https://www.thregr.org/~wavexx/software/facedetect/

DIR_IN=$(pwd)

if [ -d $1 ]
then
	DIR_IN=${1}
fi

DIR_OUT="${DIR_IN}/blur"
EXTS=( "jpg" "JPG" "png" "PNG" )

mkdir -p ${DIR_OUT}

pushd ${DIR_IN}

for EXT in ${EXTS[@]}
do
	for FILE in *.${EXT}
	do
		NAME=$(basename "$FILE")
		OUT="${DIR_OUT}/${NAME}"
		cp "${FILE}" "${OUT}"
		facedetect --best "${FILE}" | while read x y w h
		do
			mogrify -gravity NorthWest -region "${w}x${h}+${x}+${y}" -scale '10%' -scale '1000%' "${OUT}"
		done
	done
done

popd

