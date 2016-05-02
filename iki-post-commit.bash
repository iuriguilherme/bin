#!/bin/bash
## Este script serve para dar push a todos remotes configurados em um repositório GIT em um site ikiwiki.

if [ ! -z $1 ]
then
	BASE="${HOME}"
	SITE="${1}"
	DIR="${BASE}/${SITE}.git/"
	if [ -d "${DIR}" ]
	then
		pushd "${DIR}"
		REMOTES="$(git remote -v | grep -e 'push' | awk '{ print $1 }')"
		BRANCH="master"
		for REMOTE in ${REMOTES[@]}
		do
			git push ${REMOTE} ${BRANCH}
		done
		popd
	else
		echo "${DIR} não é um diretório."
	fi
else
	echo "Uso: $0 <SITE>"
fi

