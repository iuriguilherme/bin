#!/bin/bash
sudo postmap /etc/postfix/virtual
sudo newaliases
sudo service postfix reload
