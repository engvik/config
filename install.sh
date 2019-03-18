#!/bin/bash

function checksum {
    hash=$(sha256sum $1 | cut -d' ' -f1)

    if [ $hash != $2 ]
    then
        echo "Wrong $1 checksum"
        exit
    fi
}

function installBinary {
    chmod +x $1
    sudo mv $1 /usr/lib/
    sudo ln -s /usr/lib/$1 /usr/bin/$1
}

# Install from apt
sudo apt install neovim

# Install custom binaries
curl -L -o stern https://github.com/wercker/stern/releases/download/1.10.0/stern_linux_amd64
checksum stern a0335b298f6a7922c35804bffb32a68508077b2f35aaef44d9eb116f36bc7eda
installBinary stern
