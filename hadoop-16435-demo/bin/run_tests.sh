#!/bin/bash

source vars.sh

cd $BUGGY_REPO/$HADOOP_COMMON_PATH
mvn clean install -U
mvn test -Dmaven.test.failure.ignore=true -Dtest=org.apache.hadoop.ipc.metrics.TestCustomRpcMetrics
cd $HOME

cd $PATCHED_REPO/$HADOOP_COMMON_PATH
mvn clean install -U
mvn test -Dmaven.test.failure.ignore=true -Dtest=org.apache.hadoop.ipc.metrics.TestCustomRpcMetrics