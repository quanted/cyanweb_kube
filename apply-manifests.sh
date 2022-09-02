#!/bin/sh

export $(grep -v '^#' .env | xargs)  # sets env vars with .env

# Applys manifests with env vars:
envsubst < k8s/cyanweb-configmap.yml | kubectl apply -f -
envsubst < k8s/cyanweb-celery-deployment.yml | kubectl apply -f -
envsubst < k8s/cyanweb-flask-deployment.yml | kubectl apply -f -
envsubst < k8s/cyanweb-flask-service.yml | kubectl apply -f -
envsubst < k8s/cyanweb-mysql-service.yml | kubectl apply -f -
envsubst < k8s/cyanweb-mysql-sts.yml | kubectl apply -f -
envsubst < k8s/cyanweb-nginx-deployment.yml | kubectl apply -f -
envsubst < k8s/cyanweb-nginx-service.yml | kubectl apply -f -
envsubst < k8s/cyanweb-redis-deployment.yml | kubectl apply -f -
envsubst < k8s/cyanweb-redis-service.yml | kubectl apply -f -