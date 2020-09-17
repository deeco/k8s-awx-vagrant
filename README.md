# k8s-awx-vagrant
Kuberenetes cluster deployment using Vagrant, Ansible for AWX stack Traefik.

## Dependancies
Tested and verfied on macbook pro , min RAM requirements 16GB and Quad Core processor, may be run with less but will require update to Vagrantfile to lower node requirements. elastic will not start without sufficient RAM available.

Tools required to be installed for setup to run correctly.

- Virtualbox installation from https://download.virtualbox.org/virtualbox/6.1.12/VirtualBox-6.1.12-139181-OSX.dmg
- Vagrant installation https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.dmg

## Installation and setup

To run setup clone repo and browse to root directory and run setup.sh from command line, this should run the following.
- run setup.sh from root directory , this will take approx 10-45 mins depending internet speeds resources and if vagrant images need to be downloaded for virtualbox and docker requirements.

This will do the following

- vagrant up to bring up k8s clusters with number of nodes, to decrease or increase node amounts, please update the N Value in the VagrantFile https://github.com/deeco/k8s-elk-vagrant/blob/3197f44f4a7c9b711de00acfaf830c9aea889a87/VagrantFile#L3
* trafiek can be updated or run separetly using the setup_traefik shell script also https://github.com/deeco/k8s-elk-vagrant/blob/master/setup_traefik.sh

## Access to Stack and apps

- Calcio Network is configured with 10.244.0.0/16 subnet.
  Each node is assigned IP from Vagrantfile and updated incremently 

Access to elastic , kibana, apps and trafiek are all done directly via Nodeport as no lb in place or access to cluster IP as vagrant uses multiple eth interfaces.

#### If any issues connecting to kibana to verify ,please use *"kubectl get all --all-namespaces"* to verify node where pod is hosted, this will be replaced with replica set of ingress controllers from traefik.

* To access awx directly and verify use url of node assigned and dynamic port created which is shown on last step in script with Describe

- there is also a windows vm not powered up than will be in private subnet to validate if required any internal connections or web addresse's

## Remove Environment

Run following command 
* vagrant destroy -f
