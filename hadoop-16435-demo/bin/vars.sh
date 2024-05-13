#!/bin/bash

HOME=$(pwd)

BUGGY_REPO='buggy_repo'
PATCHED_REPO='patched_repo'
HADOOP_COMMON_PATH=./hadoop/hadoop-common-project/

POM_PATH=./hadoop/hadoop-common-project/hadoop-common/
CUSTOM_TEST_PATH=./hadoop/hadoop-common-project/hadoop-common/src/test/java/org/apache/hadoop/ipc/metrics/