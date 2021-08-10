#!/bin/bash

# for restarting container without errors 
if [ -f /app/tmp/pids/server.pid ]; then
  rm /app/tmp/pids/server.pid
fi

bin/rails db:migrate
bin/rails server -b 0.0.0.0
