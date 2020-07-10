#!/bin/bash

#ITEMS=$(kubectl get deployments | grep 0/0 | awk {'print $1'})

ITEMS=$(kubectl get deployments | awk {'print $1'})
for OUTPUT in $ITEMS
do
    kubectl scale deploy $OUTPUT --replicas=0
done

for OUTPUT in $ITEMS
do
    kubectl scale deploy $OUTPUT --replicas=1
done
