#!/bin/bash

# Set the target namespace
NAMESPACE="$1"

# Get the list of secret names in the namespace
SECRET_NAMES=$(kubectl get secrets -n "$NAMESPACE" -o jsonpath='{.items[*].metadata.name}')

# Loop through each secret and decode its data
for SECRET_NAME in $SECRET_NAMES; do
  echo "Decoding secret: $SECRET_NAME"
  kubectl get secret "$SECRET_NAME" -n "$NAMESPACE" -o json | jq '.data | map_values(@base64d)'
  echo
done