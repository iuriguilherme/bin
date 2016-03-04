#!/usr/bin/python
# -*- coding: utf-8 -*-
## Cria uma senha pseudo aleatória boa pra criptografia

import binascii, os, sys

## Usar 8 como tamanho por omissão se nenhum parâmetro for fornecido
tamanho = 8

## Caso um número seja fornecido, use-o como tamanho
if len(sys.argv) > 1:
	if str(sys.argv[1]).isdigit():
		tamanho = int(sys.argv[1])

print str(binascii.hexlify(os.urandom(tamanho)))

