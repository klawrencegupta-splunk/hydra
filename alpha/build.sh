#!/bin/bash
sudo snap install microk8s --classic --channel=1.18/stable
sudo usermod -a -G microk8s splunker
sudo chown -f -R splunker ~/.kube
sudo snap alias microk8s.kubectl kubectl
#log-off and then run these
microk8s enable dns
microk8s enable storage
microk8s enable metallb
microk8s enable cillium

