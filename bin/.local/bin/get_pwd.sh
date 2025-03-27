#!/bin/bash

selected=$(find ~/.secrets -type f | fzf)
if [[ -z $selected ]]; then
    exit 1
fi

gpg -d --no-symkey-cache $selected & while [ : ]; do sleep 1; done
echo ""
