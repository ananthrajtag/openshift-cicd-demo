#!/usr/bin/env bash

oc new-project hello-dev

oc new-app -f ./src/main/resources/template.yaml -n hello-dev

oc create -f ./pipeline/resources/hello-git.yaml -n hello-dev
oc create -f ./pipeline/resources/hello-image.yaml -n hello-dev

oc create -f ./pipeline/tasks/openshift-client.yaml -n hello-dev
oc create -f ./pipeline/tasks/s2i-java-8.yaml -n hello-dev

oc create -f ./pipeline/pipeline.yaml -n hello-dev