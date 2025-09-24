#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

helm uninstall --ignore-not-found --namespace kube-rbac-proxy-reproducer reproducer
kubectl delete --ignore-not-found ns kube-rbac-proxy-reproducer

helm install --create-namespace --namespace kube-rbac-proxy-reproducer reproducer reproducer

