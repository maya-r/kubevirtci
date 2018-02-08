#!/bin/bash

set -ex

VM_CID=$(docker run -d -p 5910:5901 -p 2201:2201 --privileged qemu /provision.sh)
function finish() {
    docker stop ${VM_CID}
    docker rm ${VM_CID}
}
trap finish EXIT

test -t 1 && USE_TTY="-it"
# FIXME dockerize can connect but ssh server is not yet up
sleep 10
docker exec ${USE_TTY} ${VM_CID} ssh.sh
docker exec ${USE_TTY} ${VM_CID} ssh.sh "sudo shutdown -h"
docker wait ${VM_CID}
docker commit --change "ENV PROVISIONED TRUE" ${VM_CID} ${1}
