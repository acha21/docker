#!/bin/bash
username='acha21'

echo "username: $1"

if [ "$1" != "" ]
then
   username=$1
fi

if [ "$2" != "" ]
then
   pytorch_version=$2
fi

build_cuda_docker(){
  docker build -t acha21/cuda9.0:latest \
    --build-arg USER_ID=$(id -u) \
    --build-arg GROUP_ID=$(id -g) \
    --build-arg USER_NAME="${username}" \
    -f basic.Dockerfile ..
}

build_pytorch_docker(){
  docker build -t acha21/pytorch${pytorch_version}:latest \
      -f pytorch${pytorch_version}.Dockerfile ..
}



build_cuda_docker

build_pytorch_docker
