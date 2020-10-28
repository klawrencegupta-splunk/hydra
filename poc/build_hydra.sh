#!/bin/bash
#create a splunk namespace
kubectl create ns splunk
kubectl config set-context --current --namespace=splunk

#Create a new configmap for TCP services for :8089
kubectl apply -f configmap.yaml

#Create volumes and mapping
mkdir /splunk-local
mkdir /splunk-mds

kubectl apply -f pv-local.yaml
kubectl apply -f pvclaim-local.yaml
kubectl apply -f pv-apps.yaml
kubectl apply -f pvclaim-apps.yaml
