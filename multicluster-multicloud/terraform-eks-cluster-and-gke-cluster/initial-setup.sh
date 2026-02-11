#!/bin/bash

############# Install awscli ##############

sudo yum remove -y awscli  ### Remove the installed awscli and then install the latest awscli

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o ~/awscliv2.zip
unzip ~/awscliv2.zip -d ~/
sudo ~/aws/install

echo -e "\nPATH="$PATH:/usr/local/bin"" >> ~/.bashrc
source ~/.bashrc

aws --version

###########################################
