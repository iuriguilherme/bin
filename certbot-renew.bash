#!/bin/bash
## Renova todos certificados da let's encrypt

systemctl stop nginx.service

certbot renew

systemctl start nginx.service

