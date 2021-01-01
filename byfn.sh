#!/bin/bash

function printHelp() {
  echo "Usage: "
  echo "  byfn.sh <mode>"
  echo "    <mode> - one of 'up', 'down'"
  echo "      - 'up' - bring up the network with docker-compose up"
  echo "      - 'down' - clear the network with docker-compose down"
  echo "	byfn.sh up"
  echo "	byfn.sh down"
}
function networkUp() {
  echo "Starting the fabric network"
}
function networkDown() {
  echo "Stopping the fabric network"
}

MODE=$1
if [ "${MODE}" == "up" ]; then
  networkUp
elif [ "${MODE}" == "down" ]; then ## Clear the network
  networkDown
else
  printHelp
  exit 1
fi
