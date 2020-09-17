#!/bin/sh
echo #############################################################
echo install ingress
kubectl apply -f traefik-deployment/traefik-namespace.yaml
kubectl apply -f traefik-deployment/traefik-service-account.yaml
kubectl apply -f traefik-deployment/traefik-cluster-role.yaml
kubectl apply -f traefik-deployment/persistent-volume-test.yaml
kubectl apply -f traefik-deployment/persistent-volume-claim-test.yaml
kubectl apply -f traefik-deployment/traefik-secrets.yaml
kubectl apply -f traefik-deployment/traefik-config.yaml
kubectl apply -f traefik-deployment/traefik-dyn-config.yaml
kubectl apply -f traefik-deployment/traefik-deployment.yaml
kubectl apply -f traefik-deployment/traefik-service.yaml
kubectl get all --all-namespaces