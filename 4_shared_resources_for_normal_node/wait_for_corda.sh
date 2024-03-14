#! /bin/bash

x500name_uuid=$1
is_ready=""

rcp_cert_exists=$(kubectl get secrets corda-rpccert-$x500name_uuid -o name || echo 0)

if [ "$rcp_cert_exists" != "0" ]; then
  echo 'Corda has already deployed, skip for waiting.'
  exit 0
fi

echo "Waiting for Pod: corda-node-$x500name_uuid .."
while [ "$is_ready" != "True" ]; do
  is_ready=$(kubectl get pods corda-node-$x500name_uuid-0 -o jsonpath='{.status.conditions[?(@.type=="Ready")].status}')
  echo "IsReady: "$is_ready
  [ "$is_ready" != "True" ] && sleep 1
done
echo "Pod $x500name_uuid is ready: "$is_ready
