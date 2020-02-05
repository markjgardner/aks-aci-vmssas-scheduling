#!/bin/bash

# load the descheduler policy config
kubectl create configmap descheduler-policy-configmap --from-file=descheduler-policy.yaml

# create a service account for descheduler to use when evicting pods
kubectl create sa descheduler-sa -n kube-system

# bind the account to the appropriate role
kubectl create clusterrolebinding descheduler-cluster-role-binding \
    --clusterrole=descheduler-cluster-role \
    --serviceaccount=kube-system:descheduler-sa