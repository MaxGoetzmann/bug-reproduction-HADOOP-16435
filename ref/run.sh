#!/bin/bash
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64' 
export JAVA8_HOME='/usr/lib/jvm/java-8-openjdk-amd64' 
export JAVA11_HOME='/usr/lib/jvm/java-11-openjdk-amd64' 
export JDK_HOME='/usr/lib/jvm/java-8-openjdk-amd64'

cd $HOME/hadoop
echo "Switching to the version before patch"
git checkout branch-3.3.5
# bash $HOME/ignite/run_test.sh
# echo "Done running benchmark before patch"
# echo "Switching to the version after patch"
# git checkout IG-14003-after
# bash $HOME/ignite/run_test.sh
# echo "Done running benchmark after patch"