kubectl scale --replicas=0 -f hydra.yaml
sleep 10s
kubectl scale --replicas=2 -f hydra.yaml
