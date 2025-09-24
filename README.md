SSCCE for run-as-root issue in kube-rbac-proxy 0.20.0
=====================================================

- deploy the chart with `./redeploy.sh` to a Kubernetes cluster of your choice
- `kubectl describe pod -n kube-rbac-proxy-reproducer`
- The pod will not reach the ready condition, it will get stuck in
  ```
  State: Waiting
    Reason: CreateContainerConfigError
  ```
  The following is logged as an event:
  ```
  Warning  Failed     3s (x22 over 4m28s)  kubelet            Error: container has runAsNonRoot and image will run as root (pod: "reproducer-deployment-c7b46b867-knjvq_kube-rbac-proxy-reproducer(bd44968f-710c-4481-9fc7-7f2d5e8546ba)", container: kube-rbac-proxy)
  ```
- change the kube-rbac-proxy version in `reproducer/values.yaml` to `v0.19.1`
- redeploy the chart with `./redeploy.sh`
- the pod starts cleanly now and reaches the ready condition

