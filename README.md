Small test scripts to check pv with ReadWriteOnce access mode.

Execute:

./config/test.sh

It should create two pods with parallel buildah image builds.

Also you can apply:

oc apply -f deployment.yaml

It will create deployment with two the same pods. These pods will do parallel read, write operations in the same pvc.
