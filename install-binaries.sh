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
curl -L -o gcsdk.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-310.0.0-linux-x86_64.tar.gz
tar zxf gcsdk.tar.gz -C $HOME
sh $HOME/google-cloud-sdk/install.sh --usage-reporting=false --command-completion=true --rc-path=/home/lars/.bashrc --path-update=true
rm gcsdk.tar.gz

# terraform
curl -L -o terraform.zip https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip
checksum terraform.zip a92df4a151d390144040de5d18351301e597d3fae3679a814ea57554f6aa9b24
unzip terraform.zip
installBinary terraform
rm terraform.zip

# wtfutil
curl -L -o wtf.tar.gz https://github.com/wtfutil/wtf/releases/download/v0.30.0/wtf_0.30.0_linux_amd64.tar.gz
checksum wtf.tar.gz eae3bf57ed574dc3c5cdee888b18d1c870dbaa43ca751e1ec6a7b89d65a9b7dd
tar zxf wtf.tar.gz
mv wtf_0.30.0_linux_amd64/wtfutil .
installBinary wtfutil
rm -rf wtf.tar.gz wtfutil wtf_0.30.0_linux_amd64/
