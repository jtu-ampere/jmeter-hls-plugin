#!/bin/bash
#
# Run JMeter-HLS-Server Container image with options

NAME="jmeter-hls-server"
JMETER_VERSION=${JMETER_VERSION:-"5.4.3"}
IMAGE="mrdojojo/jmeter-hls-server:${JMETER_VERSION}"
WORKPATH="/home/altrauser/vod-benchmark"

# Finally run
echo "JMeter Version: ${JMETER_VERSION} "
echo "PWD:  ${PWD}"
echo "JMeter Image:   ${IMAGE}"
echo "Parameters for JMeter:   ${@}"

# Run JMeter Server mode
podman run -dit -p 1099:1099 --env IP=[server IP address] --env RMI_PORT=1099 -v ${PWD}:${WORKPATH}:Z  -w ${WORKPATH}  ${IMAGE} $@ 
