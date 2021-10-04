#!/bin/bash

#auto log everything to syslog

find /var/log -type f | xargs -I % bash -c 'tail -f % | > >(logger --tcp --server rsyslog-server-service --port 514 -s -t $(basename $0)) 2>&1 ' &

exec 1> >(logger --tcp --server rsyslog-server-service --port 514 -s -t $(basename $0)) 2>&1

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd ./$app

npm install
npm run start
