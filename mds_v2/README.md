**Readme Multi-Deployment Server using a container strategy & MetalLB framework**

https://github.com/klawrencegupta-splunk/hydra/tree/master/mds_v1/scripts contains the build scripts needed to begin building a container based Splunk deployment service solution.

This deployment is currently compatible with Ubuntu 18.04 & has been tested with microk8s

**scripts** - Run in order & follow echo statements as needed
 * build_microk8s_1.18.sh - build script to deploy a microk8s cluster & kubectl for a single node
 * mk8.sh - enables storage, dns & metalLB addons
 * build_mds.sh - build script to deploy the following
* -- configmap.yaml - TCP services configmap
* -- lb.yaml - LoadBalancer service setting a open proxy address for HOST_IP:32740
* -- mds.yaml - deploy full Splunk image & configure
* -- pv-apps.yaml - persistent volume for /etc/deployment-apps directory
* -- pv-local.yaml - persistant volume for /etc/apps directory
* -- pvclaim-apps.yaml & pvclaim-local.yaml - persistant volume claims
* -- iptables.sh  - set IPTABLES rules to allow traffic on TCP/32740
* enable_ds.sh - enables the DS feature on all pods deployed through the CLI
* reload.sh - reloads the deployment server on all pods deployed through the CLI

**Install Overview**
The scripted install will deploy the following:
* Microk8s cluster w/ storage, dns & MetalLB addons enabled
* A TCP Configmap + MetalLB LoadBalancer Service on default port TCP/32740 > 2 full Splunk pods with mounted PV
* **/etc/apps** on each POD mapped to **/splunk-local** on Hostpath - an app with a serverclass.conf & an outputs.conf should be installed here
* **/etc/deployment-apps** on each POD mapped to **/splunk-mds** on Hostpath - repository of deployment apps to be distributed by the DS POD

**Operations -- Replicas can be scaled up/down as needed** 
* kubectl scale --replicas=0 -f mds.yaml //down
* kubectl scale --replicas=2 -f mds.yaml //up
* **sh enable_ds.sh should be run after any scaling action to enable the DS per POD**
* **sh reload.sh can be run if there was no change to the scaling but a reload needs to be issued**
