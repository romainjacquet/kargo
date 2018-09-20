#!/bin/bash
WEACAST_MODELS=$1

# Deploy the required services only
WEACAST_SERVICES_TO_DEPLOY=
for WEACAST_SERVICE in $WEACAST_MODELS; do
  WEACAST_SERVICES_TO_DEPLOY="$WEACAST_SERVICES_TO_DEPLOY -c stacks/weacast/$WEACAST_SERVICE.yml"
done
docker stack deploy $WEACAST_SERVICES_TO_DEPLOY weacast


