#! /usr/bin/env bash

# Terminate already running bat instance
# killall -q polybar
polybar-msg cmd quit

# Wait until the processes have been shut down
# while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# polybar &
polybar main 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
