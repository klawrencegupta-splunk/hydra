#!/bin/bash
kubectl delete deployment splunksds --namespace=splunk
for x in $(kubectl get pods --all-namespaces | grep splunk | awk '{print $2}'); do kubectl delete pod $x --namespace=splunk; done
