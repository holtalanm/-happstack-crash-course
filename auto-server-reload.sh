#!/bin/bash

while true; do
    stack build
    stack exec server &
    PID=$!
    inotifywait -r -e modify ./
    kill $PID
done