#!/bin/bash

if ! tmux has-session -t "vim" 2>/dev/null
then
    tmux new-session -d -s "vim"

    tmux rename-window -t "vim":1 "vim"
    tmux new-window -t "vim":2 -n "nav"
    tmux new-window -t "vim":3 -n "exec"
    tmux new-window -t "vim":4 -n "vim-cfg"
    
    tmux select-window -t "vim":1
fi

tmux attach-session -t "vim"
