#!/bin/bash
## Este script pega uma lista de links e toma as seguintes medidas:
## 1 - Arquiva as URLs na Wayback Machine <https://web.archive.org>
## 2 - Tenta extrair vídeos/áudios com o youtube-dl <https://youtube-dl.org>
## 3 - Tenta adicionar os arquivos extraídos na IPFS <https://ipfs.io>
## Este script é um trabalho em progresso e basicamente serve para evitar que as
## coisas sumam da internet, gerando redundância e melhorando a persistência

### Alterar variáveis de acordo com o ambiente
ARCHIVER_BIN="${HOME}/.local/bin/archiver"
YTDL_BIN="${HOME}/.local/bin/youtube-dl"
IPFS_BIN="/usr/bin/env ipfs"
#IPFS_BIN="$(whereis ipfs | sed 's/ipfs: //g')"

### Nome do arquivo com a lista de URLs
LISTA="lista.txt"

## Passar um arquivo de texto como parâmetro
if [[ ! -z $1 && -f $1 ]]
then
    LISTA="${1}"
else
    echo "${1} não é um arquivo, usando ${LISTA}"
fi

## Remove URLs duplicadas e organiza por ordem alfabética
LISTA_NOVA="$(echo -n "${LISTA}" | sed 's/\.[[:alnum:]]*$/\.uniq&/g')"
sort ${LISTA} | uniq 1> ${LISTA_NOVA}

## Atualiza ferramentas ou GTFO
python3 -m ensurepip
python3 -m pip install --user --upgrade pip wayback-machine-archiver youtube-dl
if [ $? -gt 0 ]
then
    exit
fi

### Wayback Machine
"${ARCHIVER_BIN}" \
--file ${LISTA_NOVA} \
--log INFO \
--archive-sitemap-also \
--jobs 1 \
--rate-limit-wait 5

### youtube-dl
## Menor tamanho possível
QUALIDADE='worstvideo+worstaudio/worst'
## Melhor qualidade possível
#QUALIDADE='bestvideo+bestaudio/best'
"${YTDL_BIN}" \
--format ${QUALIDADE} \
--batch-file ${LISTA_NOVA} \
--ignore-errors \
--id \
--mark-watched \
--continue \
--yes-playlist \
--write-description \
--write-info-json \
--write-annotations \
--write-thumbnail \
--all-subs \
--verbose

### IPFS
## pina todo o diretório atual na IPFS
"${IPFS_BIN}" add --cid-version 1 --recursive --progress --fscache --pin "$(pwd)"
