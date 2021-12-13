#!/bin/bash

CONTAINER=`docker ps -aq -f "name=tbcontainer"`

if [ -z "$CONTAINER" ];
then
    echo "tbcontainer does not exist"
else
    docker rm -f tbcontainer
    echo "tbcontainer is removed"
fi