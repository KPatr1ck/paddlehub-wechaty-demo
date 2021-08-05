export WECHATY_LOG="verbose"
export WECHATY_PUPPET_PADLOCAL_TOKEN="$WECHATY_PUPPET_SERVICE_TOKEN"
export WECHATY_PUPPET="wechaty-puppet-padlocal"

# Set port for your puppet service: must be published accessible on the internet
export WECHATY_PUPPET_SERVER_PORT=8788

docker pull wechaty/wechaty

docker run \
--rm \
-ti \
-e WECHATY_LOG \
-e WECHATY_PUPPET \
-e WECHATY_PUPPET_PADLOCAL_TOKEN \
-e WECHATY_PUPPET_SERVER_PORT \
-e WECHATY_TOKEN="proxy-server-${WECHATY_PUPPET_PADLOCAL_TOKEN}" \
-p "$WECHATY_PUPPET_SERVER_PORT:$WECHATY_PUPPET_SERVER_PORT" \
wechaty/wechaty
