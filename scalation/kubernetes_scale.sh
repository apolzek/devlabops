#!/bin/bash

deployments=$(kubectl get deployments | awk '{print $1}' | tail -n +2)
deployments_arr=($deployments)

scale_value=$(kubectl get deployments | awk '{print $2}' | cut -d "/" -f2 | tail -n +2)
scale_value_arr=($scale_value)
#echo $scale_value

#paste <(printf "%s\n" "${deployments[@]}") <(printf "%s\n" "${scale_value[@]}")

echo -e "[+] Scaling to 0 | Namespace: $NAMESPACE\n"
kubectl get deploy -n $NAMESPACE -o name | xargs -I % kubectl scale % --replicas=0 -n $NAMESPACE
sleep 2

deployments_number=$(echo $deployments | wc -w)
#echo $deployments_number
#echo ${deployments_arr[1]}

echo -e "\n[+] Scaling default value\n"
for ((i=0; i< $deployments_number ; i++)) do
  #echo ${deployments_arr[$i]} "scaled =>" ${scale_value_arr[$i]}; 
  kubectl scale --replicas=${scale_value_arr[$i]} deployment/${deployments_arr[$i]};
done
