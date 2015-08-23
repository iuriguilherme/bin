#!/bin/bash
## Reset iptables rules
## Kopied from http://ubuntuforums.org/showthread.php?t=1381516
## And from http://pikt.org/pikt/samples/iptables_reset_programs.cfg.html
## Modified

sudo ip6tables --policy INPUT ACCEPT
sudo ip6tables --policy OUTPUT ACCEPT
sudo ip6tables --policy FORWARD ACCEPT

sudo iptables --policy INPUT ACCEPT
sudo iptables --policy OUTPUT ACCEPT
sudo iptables --policy FORWARD ACCEPT

for TABLE in filter nat mangle
do
	sudo iptables -t ${TABLE} -F
	sudo iptables -t ${TABLE} -X
	sudo iptables -t ${TABLE} -Z
	sudo ip6tables -t ${TABLE} -Z
	sudo ip6tables -t ${TABLE} -F
	sudo ip6tables -t ${TABLE} -X
done

