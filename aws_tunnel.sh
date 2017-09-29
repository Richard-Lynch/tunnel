#!/bin/bash

# ------------- DOCKER --------------------
# location of key to AWS server
awsKeyLocation="./aws"
# command needed to use awsKey isntead of password
awsKeyCommand="" #"-i $awsKeyLocation"
# port l
awsPort="22222"
# user on aws
awsUser="ubuntu"
# address of aws ( if ip, may need -N )
awsAddress="ec2-54-194-71-187.eu-west-1.compute.amazonaws.com"
# port on the docker instance to bind the tunnel to
dockerPort="22"

# ------------ AWS -------------------
# locatio in git folder of turing public key
dockerKeyLocation="./turing"
# user on docker
dockerUser="tcd"
# port for docker to map to
awsPort="22222"


ssh -i $dockerKeyLocation -p $awsPort $dockerUser@localhost
