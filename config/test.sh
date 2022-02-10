#!/bin/bash

oc apply -f pvc.yaml
oc apply -f permissions.yaml

oc apply -f buildah-pod.yaml
sleep 30
oc apply -f buildah-pod-2.yaml
