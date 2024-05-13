#!/bin/bash

source vars.sh

function init_repo() {
    mkdir $1
    cd $1
    git clone https://github.com/apache/hadoop.git
    cd hadoop
    git checkout 85d9111 
}

function copy_new_files() {
    cp hcp-hp-pom.xml $1/$POM_PATH/pom.xml
    cp TestCustomRpcMetrics.java $1/$CUSTOM_TEST_PATH/TestCustomRpcMetrics.java
}

# Perform necessary installs
bash protobuf_install.sh
cd $HOME
sudo apt install maven -y

# Create buggy version of Hadoop
init_repo $BUGGY_REPO
git apply ../../test-HADOOP-16435.patch
mvn install
cd $HOME
copy_new_files $BUGGY_REPO

# Create patched version of Hadoop 
init_repo $PATCHED_REPO
git apply ../../test-HADOOP-16435.patch
git apply ../../function-HADOOP-16435.patch
cd $HOME
copy_new_files $PATCHED_REPO