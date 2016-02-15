#!/bin/bash
## Para o serviço da biblioteca

MG_P="mediagoblin-paster"
MG_CW="mediagoblin-celeryd"

sudo systemctl -l start ${MG_P}
sudo systemctl -l start ${MG_CW}

