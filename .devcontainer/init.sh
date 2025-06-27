#!/bin/bash

sudo apt update
sudo apt install -y python3-pip redis libsass-dev

pip3 install pyotp requests

curl https://nim-lang.org/choosenim/init.sh -sSf | sh
echo 'export PATH=/home/vscode/.nimble/bin:$PATH' >> ~/.bashrc
