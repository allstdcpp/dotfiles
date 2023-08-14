#!/usr/local/bin/bash

 mixer vol -5
 osdmixer d d d d &
 PID=$!
 sleep 2
 kill -SIGTERM $PID

