#!/bin/bash

#_________________________________________
# Build Image
if [ $# -eq 0 ];then
    read -r -p "Enter Image Name: " image
    docker image build -t "$image"
else
    docker image build -t "$1"
fi

#_______________________________________
# Run New Container from Image
read -r -p "Enter Container Name: " name
docker run -d -p 8080:8080 "$name"

#__________________
# Container(s) List
docker ps -a