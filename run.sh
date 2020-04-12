#!/bin/sh

# wait for a program to start listening on a PORT ($1)
wait_for_port() {
    local SERVER=$1
    local PORT=$2
    echo "waiting for $PORT"
    for i in `seq 1 60`;
    do
      nc -z $SERVER $PORT && echo "port $PORT is ready" && return
      echo -n .
      sleep 1
    done
    echo "Failed waiting for $PORT" && exit 1
}

wait_for_port $1 $2
graphql-engine serve
