#!/bin/bash

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# 0- git checkout repo

# 1- Build step
export tag=`date +%Y%m%d%H%M`
docker build -t ahhatem/webapp:$tag .

#2- Publish image
#3- Init the correct kubernetes profile

#4- Kubernetes apply
export sysloghost='rsyslog-server-service'
find Kubernetes -type f -name '*.yaml' | xargs -I % bash -c 'tee /dev/tty | cat %|envsubst | sed -e 's/\$\\-/$/g' | kubectl apply -f -; echo -e -----\>% done; sleep 2'