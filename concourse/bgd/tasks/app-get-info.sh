#!/bin/bash

set -xe

pwd
env

cf api $API --skip-ssl-validation

cf login -u $USER -p $PWD -o "$ORG" -s "$SPACE"

cf apps

cd git-repo

set +e
cf apps | grep "$APP_SUFFIX" | grep green
if [ $? -eq 0 ]
then
  echo "green" > ./app-info/current-app.txt
  echo "blue" > ./app-info/next-app.txt
else
  echo "blue" > ./app-info/current-app.txt
  echo "green" > ./app-info/next-app.txt
fi
set -xe

echo "Current main app routes to app instance $(cat ./app-info/current-app.txt)"
echo "New version of app to be deployed to instance $(cat ./app-info/next-app.txt)"