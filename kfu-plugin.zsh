kfu-dashboard () {
  kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443
}

kfu-nodelabel () {
	for x in $(kubecolor get nodes --no-headers -o name)
    		echo ${x} && kubecolor get $x -o yaml | yq .metadata.labels && echo ""
}

kfu-namespace () {
        kubectl get namespaces --no-headers -o custom-columns=":metadata.name" | sort
        echo "Switch to namespace:"
        read NAMESPACE
        kubectl config set-context --current --namespace=$NAMESPACE

}
