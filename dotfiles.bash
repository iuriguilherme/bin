#!/bin/bash
## Arquivos de configuração para ${HOME}

## Adiciona aliases e functions do bash
## Não é bom se acostumar com comandos não padrões, porque num computador novo ou no computador das outras pessoas não vai ter essas coisas. Decore os comandos padrão!
echo 'if [ -f ~/.bash_aliases ]' 1>> ~/.bashrc
echo 'then' 1>> ~/.bashrc
echo -e "\t"'. ~/.bash_aliases' 1>> ~/.bashrc
echo 'fi' 1>> ~/.bashrc
echo 'function rmv {' 1>> ~/.bash_aliases
echo -e "\t"'rsync -avvvhP --remove-source-files "${@}" && find "${@}" -type d -empty -delete' 1>> ~/.bash_aliases
echo '}' 1>> ~/.bash_aliases
echo 'function rcp {' 1>> ~/.bash_aliases
echo -e "\t"'rsync -avvvhP "${@}" && find "${@}" -type d -empty -delete' 1>> ~/.bash_aliases
echo '}' 1>> ~/.bash_aliases

## Vim
echo 'syntax on' 1>> ~/.vimrc
echo 'set number' 1>> ~/.vimrc
echo 'set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab' 1>> ~/.vimrc

## X11
echo 'setxkbmap -layout "us,br" -option "grp:lwin_toggle"' 1>> ~/.xinitrc

