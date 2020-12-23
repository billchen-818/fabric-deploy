#! /bin/bash

SYS_CHANNEL=system-channel COMPOSE_PROJECT_NAME=net docker-compose -f docker/docker-compose-test-net.yaml up -d