#!/bin/bash

secrets=$(find ~/.secrets -type f)

selected=$(fzf --prompt "Select a secret > " <<< "$secrets")
if [[ -z $selected ]]; then
    exit 0
fi

gpg -d --no-symkey-cache "$selected" & while true; do sleep 1; done
# echo ""
