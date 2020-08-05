#!/bin/bash
for x in $(kubectl get pods --all-namespaces | grep splunk | awk '{print $2}'); do kubectl delete pod $x; done
