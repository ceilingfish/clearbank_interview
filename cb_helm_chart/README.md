# Summary

This help chart defines the following:
* A deployment - This ensure that two pods are running
* A service - To expose the deployment on port 80
* A config map - To store the customisable text
* A pod disruption budget - To describe the required minimum of 1 pod running
* A KEDA scaling policy - To describe how to autoscale the deployment.

All of these except [KEDA](https://keda.sh) are native Kubernetes features. To install [KEDA](https://keda.sh) do the following:

    helm repo add kedacore https://kedacore.github.io/charts
    helm repo update
    helm install keda kedacore/keda

To install this helm chart do the following:

    cd /path/to/this/helm/chart
    kubectl create namespace demo
    helm install -n demo .
    kubectl port-forward -n demo service/nginx 80:80

You can then browse to http://localhost to view the content.