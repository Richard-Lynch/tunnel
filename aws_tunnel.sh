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
echo "Programs listening to port $awsPort"
sudo fuser $awsPort/tcp
read -p "Kill all?" yn
while true ; do
	case $yn in
		[Yy] | [Yy][Ee][Ss] )
			echo "Killing"
			sudo fuser $awsPort/tcd -k
			break		
			;;
		[Nn] | [Nn][Oo] )
			echo "Not Killing"
			exit;;
		*)
			echo "Yes or no only please";;
esac




