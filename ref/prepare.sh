#!/bin/bash
echo "Setting up environment..."
sudo apt-get update > /dev/null
sudo apt-get install -y  openjdk-11-jdk openjdk-8-jdk build-essential maven ant ant-optional libnuma-dev > /dev/null
sudo echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.bashrc
sudo echo 'export JAVA8_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.bashrc
sudo echo 'export JAVA11_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> ~/.bashrc
sudo echo 'export JDK_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.bashrc
source ~/.bashrc
echo "Cloning hadoop code base..."
git clone https://github.com/apache/hadoop > /dev/null
echo "Done!"