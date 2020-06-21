#!/bin/bash

#PROBLEMS=$(kubectl get deployments | grep 0/0 | awk {'print $1'})
PROBLEMS=$(kubectl get deployments | awk {'print $1'})
for OUTPUT in $PROBLEMS
do
    kubectl scale deploy $OUTPUT --replicas=0
done

for OUTPUT in $PROBLEMS
do
    kubectl scale deploy $OUTPUT --replicas=1
done
