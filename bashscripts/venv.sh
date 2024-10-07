#!/bin/bash

if [[ $VIRTUAL_ENV != "" ]]
then
    deactivate
    return
else
    source "./venv/bin/activate"
fi
