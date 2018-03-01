#!/usr/bin/env bash

# Required to set environment. Dehydrated has issues otherwise.
env > /etc/environment

# Make sure we already registered with Let's Encrypt via dehydrated client
/app/dehydrated/dehydrated --register --accept-terms

# Start cron
cron

# Start nginx. Start with daemon off so the docker container keeps running.
# If this is not done, the container will immediately shutdown since Docker
# requires a process to be running in the foreground.
nginx -g 'daemon off;' "$@"