#!/bin/bash
# ------------- DOCKER --------------------
# port on aws to be mapped to port on docker ( this will be the port you'll ssh to from aws )
awsPort="22222"
# user on aws ( you will need to have privilage for this user )
awsUser="ubuntu"
# address of aws ( web address )
awsAddress="ec2-54-194-71-187.eu-west-1.compute.amazonaws.com"
# port on the docker instance to bind the tunnel to
dockerPort="22"

echo "Connecting to AWS from docker to create tunnel" >&2
echo "You will be requested to enter the password for $awsUser on AWS" >&2
ssh -f -N -T -R $awsPort:localhost:$dockerPort $awsUser@$awsAddress
echo "Adding key to docker" >&2
cat id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
echo "Key added to docker" >&2

