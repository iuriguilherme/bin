#!/bin/bash
## Download da última versão do youtube-dl

YTDL_URL="https://yt-dl.org/downloads/latest/youtube-dl"
YTDL_PATH="${HOME}/bin/youtube-dl"

if [ ! -f ${YTDL_PATH} ]
then
  wget -c ${YTDL_URL} -O ${YTDL_PATH}
  chmod ug+x ${YTDL_PATH}
  wget -c ${YTDL_URL}.sig -O youtube-dl.sig
  gpg --verify youtube-dl.sig ${YTDL_PATH}
  rm youtube-dl.sig
fi

