#!/bin/bash

# ------------ AWS -------------------
# locatio in git folder of turing public key
dockerKeyLocation="./id_rsa"
# user on docker
dockerUser="tcd"
# port for docker to map to
awsPort="22222"
# user on aws
awsUser="ubuntu"

ssh-keygen -f "/home/$awsUser/.ssh/known_hosts" -R [localhost]:$awsPort
ssh -i $dockerKeyLocation -p $awsPort $dockerUser@localhost
