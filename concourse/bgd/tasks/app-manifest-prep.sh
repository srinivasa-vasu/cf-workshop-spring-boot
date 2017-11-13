#!/bin/bash

set -xe

cat ./app-info/current-app.txt

cd git-repo

sed "s/boot-app/$(cat ./app-info/next-app.txt)-$APP_SUFFIX/" ./manifest.yml > ../app-manifest-output/manifest.yml

cat ../app-manifest-output/manifest.yml