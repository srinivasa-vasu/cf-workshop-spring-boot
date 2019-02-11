#!/bin/bash

set -xe

#Get the version number from the file passed in as a env var named 'version'
version=`cat $version`

cd git-repo
mvn package

#mvn clean verify deploy -Ddistribution.management.release.id=artifactory-local -Ddistribution.management.release.url=http://jfrog.humourmind.com:8081/artifactory/libs-release-local

cp target/cf-workshop-spring-boot-*.jar ../artifacts/boot-app-$version.jar