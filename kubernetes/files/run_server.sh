#!/bin/bash
cluster_name="qac-game-of-life"
num_nodes=3
service_name="python_app_server"

# Initialise gcloud
gcloud init

# Build cluster
gcloud container clusters create $cluster_name --zone europe-west2-c --num-nodes $num_nodes

# Enable Kubernetes API
gcloud config set project $(gcloud projects list | grep $cluster_name | cut -d" " -f1)
gcloud services enable $(gcloud services list --available | grep Kubernetes | cut -d" " -f1)

# Create from yml
kubectl create -f "$service_name".yml
sleep 30s

# Find the public ip of the service
echo "The public IP for the service is: "
echo $(kubectl get services | grep $service_name | cut -d" " -f10)

