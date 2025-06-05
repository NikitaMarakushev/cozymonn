Helm Chart and kubernetes manifests

1) Install via Helm:
```helm install cozymonn ./cozymonn-helm --create-namespace --namespace monitoring```

2) Upgrade release:
```helm upgrade cozymonn ./cozymonn-helm --namespace monitoring```

3) Uninstall release:
```helm uninstall cozymonn --namespace monitoring```

4) Validate chart:
```helm lint ./cozymonn-helm```