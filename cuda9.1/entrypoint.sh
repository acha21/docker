#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}

USER_NAME='acha21'

echo "Starting with UID : $USER_ID"

useradd --shell /bin/bash -u $USER_ID -o -c "" -m $USER_NAME

groupadd $USER_NAME

chown -R $USER_NAME:$USER_NAME /home/$USER_NAME

export HOME='/home/$USER_NAME'

echo "$@"

exec /usr/local/bin/gosu $USER_NAME "$@"


