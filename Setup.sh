#!/bin/bash

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# 0- git checkout repo

# 1- Build step
export tag=`date +%Y%m%d%H%M`
docker build -t ahhatem/webapp:$tag .

#2- Publish image
#3- Init the correct kubernetes profile

#4- Kubernetes apply
find Kubernetes -type f | xargs -I % bash -c 'cat %|envsubst|kubectl apply -f -'