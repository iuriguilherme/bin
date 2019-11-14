#!/bin/bash
## Arquivos de configuração para ${HOME}

ARQUIVO_BASHRC="${HOME}/.bashrc"
ARQUIVO_BASH_ALIASES="${HOME}/.bash_aliases"
ARQUIVO_VIMRC="${HOME}/.vimrc"
ARQUIVO_XINITRC="${HOME}/.xinitrc"

## Adiciona aliases e functions do bash
## Não é bom se acostumar com comandos não padrões, porque num computador novo ou no computador das outras pessoas não vai ter essas coisas. Decore os comandos padrão!
echo "if [ -f ${ARQUIVO_BASH_ALIASES} ]" 1>> ${ARQUIVO_BASHRC}
echo 'then' 1>> ${ARQUIVO_BASHRC}
echo -e "\t"'. ${ARQUIVO_BASH_ALIASES}' 1>> ${ARQUIVO_BASHRC}
echo 'fi' 1>> ${ARQUIVO_BASHRC}
echo 'function rmv {' 1>> ${ARQUIVO_BASH_ALIASES}
echo -e "\t"'rsync -avvhSP --remove-source-files "${@}" && find "${@}" -type d -empty -delete' 1>> ${ARQUIVO_BASH_ALIASES}
echo '}' 1>> ${ARQUIVO_BASH_ALIASES}
echo 'function rcp {' 1>> ${ARQUIVO_BASH_ALIASES}
echo -e "\t"'rsync -avvhSP "${@}" && find "${@}" -type d -empty -delete' 1>> ${ARQUIVO_BASH_ALIASES}
echo '}' 1>> ${ARQUIVO_BASH_ALIASES}

## Vim
echo 'syntax on' 1>> ${ARQUIVO_VIMRC}
echo 'set number' 1>> ${ARQUIVO_VIMRC}
echo 'set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab' 1>> ${ARQUIVO_VIMRC}

## X11
echo 'setxkbmap -layout "us,br" -option "grp:lwin_toggle"' 1>> ${ARQUIVO_XINITRC}

