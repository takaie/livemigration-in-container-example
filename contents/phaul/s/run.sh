#!/bin/bash

WORKING_DIR=$(dirname $0)
cd $WORKING_DIR

rm -rf /tmp/livemig image
./phaul-server
