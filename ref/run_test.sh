#!/bin/bash

mvn clean

test_target="org/apache/hadoop/fs/azurebfs/AbstractAbfsIntegrationTest.java"
result_file="raw_result_before"

[ -f "$result_file" ] && rm "$result_file"

mvn clean test -U -Plgpl,examples,-clean-libs,-release -Dmaven.test.failure.ignore=true -DfailIfNoTests=false -Dtest=org.apache.hadoop.fs.azurebfs.AbstractAbfsIntegrationTest &> test.log
echo "###" >> "$result_file"
grep -F '!!!' test.log >> "$result_file"

mv "$result_file" "$HOME"
rm test.log
git restore .
