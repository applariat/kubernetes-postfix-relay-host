#!/usr/bin/env bash

# Put your password in a file called tx-smtp-relay-password
echo "---
apiVersion: v1
kind: Secret
metadata:
  name: global-env
data:
  tx-smtp-relay-password: `base64 tx-smtp-relay-password`
" | kubectl create -f -