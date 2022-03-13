# Multi-region kubernetes cluster

A multi-region kubernetes cluster deployment using ansible playbooks

## Getting started

Requirements,

-	 Amazon Web Services account
-    Ansible
-    Python

## Steps

Follow the following the steps for running a multi-region kubernetes cluster,

-    `git clone git@github.com:yebh17/mr_kubernetes_cluster.git`
###### Note: Github deprecated usage of https authentication, so use token authentication.

-    `cd mr_kubernetes_cluster`

-    Go to your AWS account and create keypair in a desired AWS region (I choose where my master will be deployed) and download it with .pem extension to the root of this project.

-    `chmod 400 <your-keypair-name>.pem`
-    `ssh-keygen -y -f <your-keypair-name>.pem > <your-new-public-keypair-name>.pub`

-    Go to your AWS account and go to the desired different region where you wanted to run other slave nodes and go to AWS keypairs section and click on import keypairs and provide your private key name and import your newly created public keypair with .pub extension and thus you will be having the same private keys in all the regions (In this project we will be using 'eu-north-1' for one master and one slave node, and then 'us-west1', 'ap-southeast-1' for one slave node each)

-    `sudo apt update`
-    `sudo apt install software-properties-common`
-    `sudo add-apt-repository --yes --update ppa:ansible/ansible`
-    `sudo apt install ansible`
-    `sudo apt-get install python3.6`
-    `ansible-vault create cred.yml`

-    Add your AWS account access_key and secret_key in the VI editor and save it

-   `sudo ansible-playbook setup.yml --ask-vault-pass`

Now this will do all the magic!