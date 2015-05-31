#!/bin/bash
## Inicia o serviço da biblioteca

MG_P="/etc/init.d/mg-paster"
MG_CW="/etc/init.d/mg-celery-worker"

sudo ${MG_P} start
sudo ${MG_CW} start
