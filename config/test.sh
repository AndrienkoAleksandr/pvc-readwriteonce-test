#!/bin/bash

oc apply -f pvc.yaml
oc apply -f permissions.yaml
oc delete -f example-pod.yaml -f example-pod-2.yaml
oc apply -f example-pod.yaml -f example-pod-2.yaml
