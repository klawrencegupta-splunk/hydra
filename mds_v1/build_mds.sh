#!/bin/bash
#create a splunk namespace
kubectl create ns splunk
kubectl config set-context --current --namespace=splunk

#Create a new configmap for TCP services for :8089
kubectl apply -f configmap.yaml
kubectl apply -f lb.yaml

#Create volumes and mapping
sudo mkdir /splunk-local
sudo mkdir /splunk-mds

kubectl apply -f pv-appdata.yaml
kubectl apply -f pvclaim-appdata.yaml
kubectl apply -f pv-config.yaml
kubectl apply -f pvclaim-config.yaml

sleep 5s

kubectl apply -f mds.yaml

sleep 15s

sh enable_ds.sh
