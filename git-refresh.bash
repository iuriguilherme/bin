#!/bin/bash

for REPO in ${HOME}/git/*
do
        cd ${REPO}
        /usr/bin/git pull
done

