#!/bin/bash

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd ./$app

npm install
npm run start
