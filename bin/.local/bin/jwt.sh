#!/usr/bin/env bash

readarray -d '.' parts 

for i in 0 1; do
    p=${parts[$i]%'.'}
    padding=$(( (4 - ${#p} % 4 ) % 4 ))
    echo "$p$(printf '%*s' "$padding" '' | tr ' ' '=')" | base64 -d | jq
done
