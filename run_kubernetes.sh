#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=thanhlong1543/ml-microservice:v1.0

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run ml-microservice \
	            --image=$dockerpath \
		    --port=80\
		    --labels app=ml-microservice

# Step 3:
# List kubernetes pods
kubectl get pods
# Step 4:
# Forward the container port to a host
kubectl port-forward ml-microservice --address 0.0.0.0 8000:80
kubectl logs -f ml-microservice

