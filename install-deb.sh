#!/bin/bash

curl -L -o fd.deb https://github.com/sharkdp/fd/releases/download/v7.3.0/fd_7.3.0_amd64.deb

sudo dpkg -i fd.deb 

rm fd.deb

