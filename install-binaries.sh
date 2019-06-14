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


# Stern
curl -L -o stern https://github.com/wercker/stern/releases/download/1.10.0/stern_linux_amd64
checksum stern a0335b298f6a7922c35804bffb32a68508077b2f35aaef44d9eb116f36bc7eda
installBinary stern

# Go
curl -L -o golang.tar.gz https://dl.google.com/go/go1.12.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf golang.tar.gz
rm -rf golang.tar.gz

# Protoc
curl -L -o protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v3.7.1/protoc-3.7.1-linux-x86_64.zip
unzip protoc.zip -d protocfiles/
mv protocfiles/bin/protoc .
installBinary protoc
sudo mv protocfiles/include /usr/local
rm -rf protocfiles/ protoc.zip */

# slackcat
curl -L -o slackcat https://github.com/bcicen/slackcat/releases/download/v1.6/slackcat-1.6-linux-amd64
installBinary slackcat
echo "slackcat is not configured, use slackat --configure to set up"

