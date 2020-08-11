#!/bin/bash

set -euo pipefail

function fatal() {
   echo "error: $1" >&2
   exit 1
}

[ -n "${K8S_POD_NAME:-""}" ] || fatal "K8S_POD_NAME variable must be set"


export http_proxy=""
kubectl annotate pods $K8S_POD_NAME JOBSTART=$(date +%s) || fatal "Can't annotate job start"

