#!/bin/bash

cd /opt/atlassian-bitbucket-6.10.0/bin

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export BITBUCKET_HOME=/opt/atlassian-bitbucket-data

./start-bitbucket.sh

