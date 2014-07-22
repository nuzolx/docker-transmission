#!/bin/bash

DOWNLOAD_DIR="/home/downloads"

[ ! -d $DOWNLOAD_DIR  ] && mkdir -p $DOWNLOAD_DIR


docker build -t "stevenmartins/transmission" .
