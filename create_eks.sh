#!/bin//bash

eksctl create cluster \
--name $1 \
--version 1.15 \
--region us-east-1 \
--nodegroup-name standard-workers \
--node-type t3.small \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 \
--node-ami auto