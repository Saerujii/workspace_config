#!/bin/bash

WORKDIR="$HOME/Python/live-reload"
source "$WORKDIR/venv/bin/activate"

python3 "$WORKDIR/main.py"

deactivate
