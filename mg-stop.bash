#!/bin/bash
## Para o serviço da biblioteca

MG_P="/etc/init.d/mg-paster"
MG_CW="/etc/init.d/mg-celery-worker"
MG_P_PID="/var/run/mediagoblin/mg-paster.pid"
MG_CW_PID="/var/run/mediagoblin/mg-celery-worker.pid"


sudo ${MG_P} stop || sudo rm ${MG_P_PID}
sudo ${MG_CW} stop || sudo rm ${MG_CW_PID}

