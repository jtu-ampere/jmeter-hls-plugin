#!/bin/bash
#
# Run JMeter-HLS-Plug Container image with options

NAME="jmeter-hls-plugin"
JMETER_VERSION=${JMETER_VERSION:-"5.4.3"}
#JMETER_VERSION=${JMETER_VERSION:-"latest"}
IMAGE="mrdojojo/jmeter-hls-plugin:${JMETER_VERSION}"
WORKPATH="/home/altrauser/vod-benchmark"

# Finally run
echo " JMeter Version: ${JMETER_VERSION} "
echo "PWD:  ${PWD}"
echo " JMeter Image:   ${IMAGE}"
echo "Parameters for JMeter:   ${@}"

$podman run --rm --name ${NAME} -i -v ${PWD}:${PWD} -w ${PWD} ${IMAGE} $@
sudo podman run --rm --cpuset-cpus 1-30 --pids-limit=-1 --name ${NAME} -i -v ${PWD}:${WORKPATH}:Z  -w ${WORKPATH}  ${IMAGE} $@
