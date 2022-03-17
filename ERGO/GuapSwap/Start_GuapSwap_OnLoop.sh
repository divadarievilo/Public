#!/bin/bash
# Start GuapSwap with a new Tmux Session
# NOTE: Change GuapSwap installation folder

tmux new-session -d -s GuapSwap
tmux send-keys -t GuapSwap:0 "cd ~/guapSwap/guapswap-1.0.1-beta ; java -jar guapswap-1.0.1-beta.jar swap <YOUR GENERATED ERGO PROXY ADDRESS>" Enter
tmux a