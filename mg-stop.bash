#!/bin/bash
## Para o serviço da biblioteca

MG_P="/etc/init.d/mg-paster"
MG_CW="/etc/init.d/mg-celery-worker"

sudo ${MG_P} stop
sudo ${MG_CW} stop
