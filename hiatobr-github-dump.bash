#!/bin/bash
## Script pra clonar todos repositórios do hacklab independência - R.I.P.

## Mude isto para o diretório alvo. Por omissão, cria um subdiretório "hiatobr-github-dump"
TARGET_DIR="$(pwd)/hiatobr-github-dump"

## Não (tinha que) precisa(r) mudar nada daqui pra baixo. A menos que tu esteja alterando este script pra tirar a tua organização ou conta pessoal do github =D

GITHUB_LINK="https://github.com/hiatobr"

REPOS=( \
"ikiwiki-bootstrap-theme-2" \
"sos.hi.ato.br" \
"octopress.tem.blog.br" \
"tem.blog.br" \
"alguem.tem.blog.br" \
"politica.xyz" \
"bash-scripts" \
"midiacapoeira" \
"www.hi.ato.br" \
"debaixo_theme" \
"quem.tem.blog.br" \
"Paloma" \
"Os-Doze-Passos-para-xs-Ateus" \
"a-desconstrucao-do-personagem" \
)

mkdir -p "${TARGET_DIR}"

for REPO in ${REPOS[@]}
do
	git clone "${GITHUB_LINK}/${REPO}.git"
done

