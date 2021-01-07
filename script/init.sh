#!/bin/bash

export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

peer channel create -o orderer.example.com:7050 -c mychannel -f ./channel-artifacts/channel.tx --tls --cafile $ORDERER_CA

peer channel join -b mychannel.block

peer chaincode install -n account -v 1.0 -l golang -p github.com/chaincode/account-assert/

peer chaincode instantiate -o orderer.example.com:7050 --tls --cafile $ORDERER_CA -n account -C mychannel -v 1.0 -c '{"Args":["init"]}' -P "OR('Org1MSP.peer','Org2MSP.peer')"

peer chaincode install -n htlc -v 1.0 -l golang -p github.com/chaincode/htlc/

peer chaincode instantiate -o orderer.example.com:7050 --tls --cafile $ORDERER_CA -n htlc -C mychannel -v 1.0 -c '{"Args":["init"]}' -P "OR('Org1MSP.peer','Org2MSP.peer')"
