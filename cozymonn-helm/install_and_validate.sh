#!/bin/bash
set -e

RELEASE_NAME="cozymonn"
NAMESPACE="monitoring"
CHART_PATH="./cozymonn-helm"

function check_namespace() {
  if ! kubectl get namespace $NAMESPACE &>/dev/null; then
    echo "Namespace $NAMESPACE not found. Creating..."
    kubectl create namespace $NAMESPACE
  fi
}

function install_or_upgrade() {
  if helm status $RELEASE_NAME -n $NAMESPACE &>/dev/null; then
    echo "Upgrading Helm release $RELEASE_NAME..."
    helm upgrade $RELEASE_NAME $CHART_PATH -n $NAMESPACE
  else
    echo "Installing Helm release $RELEASE_NAME..."
    helm install $RELEASE_NAME $CHART_PATH -n $NAMESPACE --create-namespace
  fi
}

function validate_deployment() {
  echo "Validating deployment status..."
  kubectl rollout status deployment/prometheus -n $NAMESPACE
  kubectl rollout status deployment/grafana -n $NAMESPACE
  kubectl get pods -n $NAMESPACE
}

check_namespace
install_or_upgrade
validate_deployment

echo "Deployment complete!"
