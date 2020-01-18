#!/usr/bin/env python
# -*- coding: utf-8 -*-
## Cria uma senha pseudo aleatória boa pra criptografia

import binascii, os, sys

## Usar 8 como tamanho por omissão se nenhum parâmetro for fornecido
tamanho = 8

## Caso um número seja fornecido, use-o como tamanho
if len(sys.argv) > 1 and str(sys.argv[1]).isdigit():
  tamanho = int(sys.argv[1])

senha = os.urandom(tamanho)

print(u"HEX:\n%s\n" % binascii.hexlify(senha).decode('utf-8'))
print(u"B64:\n%s" % binascii.b2a_base64(senha).decode('utf-8'))
print(u"HQX:\n%s\n" % binascii.b2a_hqx(binascii.rlecode_hqx(senha)).decode('utf-8'))
