#! /bin/sh
#Rev1
# java -Xmx4g -jar ergo-4.0.23.jar --mainnet -c ergo.conf

#Rev2 
# Copy the latest node file and rename it to "ergo.jar" (example: ergo-4.0.23.jar  ->  ergo.jar)
# This way there is no need to change the script for every time the node file is updated in GitHub
# https://github.com/ergoplatform/ergo/releases
java -Xmx4g -jar ergo.jar --mainnet -c ergo.conf