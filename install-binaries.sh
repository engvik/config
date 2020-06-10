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

# nvim
curl -L -o nvim.tar.gz https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar zxf nvim.tar.gz
sudo mv nvim-linux64/share/* /usr/local/share
sudo mv nvim-linux64/bin/* /usr/local/bin
rm -rf nvim-linux64/
rm nvim.tar.gz

# Go
curl -L -o golang.tar.gz https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz
checksum golang.tar.gz 512103d7ad296467814a6e3f635631bd35574cab3369a97a323c9a585ccaa569
sudo tar -C /usr/local -xzf golang.tar.gz
rm golang.tar.gz

# Stern
curl -L -o stern https://github.com/wercker/stern/releases/download/1.10.0/stern_linux_amd64
checksum stern a0335b298f6a7922c35804bffb32a68508077b2f35aaef44d9eb116f36bc7eda
installBinary stern

# Protoc
curl -L -o protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v3.7.1/protoc-3.7.1-linux-x86_64.zip
unzip protoc.zip -d protocfiles/
mv protocfiles/bin/protoc .
installBinary protoc
sudo mv protocfiles/include /usr/local
rm -rf protocfiles/ protoc.zip

# slackcat
curl -L -o slackcat https://github.com/bcicen/slackcat/releases/download/v1.6/slackcat-1.6-linux-amd64
installBinary slackcat
echo "slackcat is not configured, use slackat --configure to set up"

# google-cloud-sdk
curl -L -o gcsdk.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-253.0.0-linux-x86_64.tar.gz
tar zxf gcsdk.tar.gz -C $HOME
sh $HOME/google-cloud-sdk/install.sh --usage-reporting=false --command-completion=true --rc-path=/home/lars/.bashrc --path-update=true
rm gcsdk.tar.gz

# terraform
curl -L -o terraform.zip https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip
checksum terraform.zip 607bc802b1c6c2a5e62cc48640f38aaa64bef1501b46f0ae4829feb51594b257
unzip terraform.zip
installBinary terraform
rm terraform.zip
