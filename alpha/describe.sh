#!/bin/bash
for x in $(kubectl get pods --all-namespaces | grep splunk | awk '{print $1}'); do kubectl describe pod $x --namespace=splunk; done
