#!/bin/bash

set -xe

cd git-repo

cat ./app-info/current-app.txt

sed "s/boot-app/$(cat ./app-info/next-app.txt)-$APP_SUFFIX/" ./manifest.yml > ./app-manifest-output/manifest.yml

cat ./app-manifest-output/manifest.yml