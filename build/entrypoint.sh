#!/bin/sh -e
[ "$1" = 'keybox' ] && { chown -R admin .; exec gosu admin ./startKeyBox.sh; } || :
exec "$@"
