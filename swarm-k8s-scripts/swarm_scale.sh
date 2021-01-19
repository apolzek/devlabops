#!/bin/bash

#check_docker

docker service ls | tail -n +2 >.services_docker_swarm.tmp
dt=$(date '+%d_%m_%Y:%H_%M_%S')

function helper() {
  echo -e "\nOPTIONS:"
  echo "swarmscale.sh onebyone"
  echo "swarmscale.sh downup"
}

function checkfile() {
  if [ -s "$1" ]; then
    #echo [DEBUG] "file exists and is not empty "
    return 0
  else
    #echo "file does not exist, or is empty "
    return 7
  fi
}

function onebyone() {
  while read line; do
    service_name=$(echo $line | awk {'print $2'})
    scale_number=$(echo $line | awk '{print $4}' | cut -d "/" -f1)
    #echo "[DEBUG] $service_name = $scale_number"
    docker service scale $service_name=0
    sleep 1
    docker service scale $service_name=$scale_number
  done <.services_docker_swarm.tmp
}

function downup() {
  while read line; do
    service_name=$(echo $line | awk {'print $2'})
    #echo "[DEBUG] $service_name = $scale_number"
    docker service scale $service_name=0
  done <.services_docker_swarm.tmp

  while read line; do
    service_name=$(echo $line | awk {'print $2'})
    scale_number=$(echo $line | awk '{print $4}' | cut -d "/" -f1)
    #echo "[DEBUG] $service_name = $scale_number"
    docker service scale $service_name=$scale_number
  done <.services_docker_swarm.tmp
}

checkfile .services_docker_swarm.tmp
if [ $? != 0 ]; then
  helper
  exit
fi

if [ $# == 1 ]; then
  if [ $1 == "onebyone" ]; then
    onebyone
  elif [ $1 == "downup" ]; then
    downup
  else
    echo "Missing or invalid argument !"
    helper
    exit
  fi
else
  echo "Missing or invalid argument !"
  helper
  exit
fi
