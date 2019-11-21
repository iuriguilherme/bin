#!/bin/bash
## Arquivos de configuração para ${HOME}

ARQUIVO_BASHRC="${HOME}/.bashrc"
ARQUIVO_BASH_ALIASES="${HOME}/.bash_aliases"
ARQUIVO_VIMRC="${HOME}/.vimrc"
ARQUIVO_XINITRC="${HOME}/.xinitrc"
ARQUIVO_PROFILE="${HOME}/.profile"
ARQUIVO_PROFILE_KALI="${HOME}/.profile"

## Comentar e descomentar cada um
ARQUIVO_NENHUM="${HOME}/nenhum"
#ARQUIVO_BASHRC=${ARQUIVO_NENHUM}
#ARQUIVO_BASH_ALIASES=${ARQUIVO_NENHUM}
#ARQUIVO_VIMRC=${ARQUIVO_NENHUM}
#ARQUIVO_XINITRC=${ARQUIVO_NENHUM}
#ARQUIVO_PROFILE=${ARQUIVO_NENHUM}
#ARQUIVO_PROFILE_KALI=${ARQUIVO_NENHUM}

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

## bin local
echo 'NEW_PATHS=( \' 1>> ${ARQUIVO_PROFILE}
echo '"${HOME}/bin" \' 1>> ${ARQUIVO_PROFILE}
echo '"${HOME}/.local/bin" \' 1>> ${ARQUIVO_PROFILE}
echo ')' 1>> ${ARQUIVO_PROFILE}
echo 'for NEW_PATH in ${NEW_PATHS[@]}' 1>> ${ARQUIVO_PROFILE}
echo 'do' 1>> ${ARQUIVO_PROFILE}
echo '  if [ -d "${NEW_PATH}" ]' 1>> ${ARQUIVO_PROFILE}
echo '  then' 1>> ${ARQUIVO_PROFILE}
echo '    PATH="${NEW_PATH}:$PATH"' 1>> ${ARQUIVO_PROFILE}
echo '  fi' 1>> ${ARQUIVO_PROFILE}
echo 'done' 1>> ${ARQUIVO_PROFILE}

## cpanminus local
echo 'eval $(perl -I ~/perl5/lib/perl5 -Mlocal::lib)' 1>> ${ARQUIVO_PROFILE}

echo '# ~/.profile: executed by Bourne-compatible login shells.' 1> ${ARQUIVO_PROFILE_KALI}
echo 1>> ${ARQUIVO_PROFILE_KALI}
echo 'if [ "$BASH" ]; then' 1>> ${ARQUIVO_PROFILE_KALI}
echo ' if [ -f ~/.bashrc ]; then' 1>> ${ARQUIVO_PROFILE_KALI}
echo '    . ~/.bashrc' 1>> ${ARQUIVO_PROFILE_KALI}
echo '  fi' 1>> ${ARQUIVO_PROFILE_KALI}
echo 'fi' 1>> ${ARQUIVO_PROFILE_KALI}
echo 1>> ${ARQUIVO_PROFILE_KALI}
echo 'NEW_PATHS=( \' 1>> ${ARQUIVO_PROFILE_KALI}
echo '"${HOME}/bin" \' 1>> ${ARQUIVO_PROFILE_KALI}
echo '"${HOME}/.local/bin" \' 1>> ${ARQUIVO_PROFILE_KALI}
echo ')' 1>> ${ARQUIVO_PROFILE_KALI}
echo 'for NEW_PATH in ${NEW_PATHS[@]}' 1>> ${ARQUIVO_PROFILE_KALI}
echo 'do' 1>> ${ARQUIVO_PROFILE_KALI}
echo '  if [ -d "${NEW_PATH}" ]' 1>> ${ARQUIVO_PROFILE_KALI}
echo '  then' 1>> ${ARQUIVO_PROFILE_KALI}
echo '    PATH="${NEW_PATH}:$PATH"' 1>> ${ARQUIVO_PROFILE_KALI}
echo '  fi' 1>> ${ARQUIVO_PROFILE_KALI}
echo 'done' 1>> ${ARQUIVO_PROFILE_KALI}
echo 1>> ${ARQUIVO_PROFILE_KALI}
echo 'mesg n || true' 1>> ${ARQUIVO_PROFILE_KALI}

