#!/bin/bash
# Start GuapSwap (1h loop) with a new Tmux Session
tmux new-session -d -s GuapSwap
tmux send-keys -t GuapSwap:0 "cd ~/guapSwap/guapswap-1.0.1-beta ; java -jar guapswap-1.0.1-beta.jar swap <YOUR GENERATED ERGO PROXY ADDRESS>" Enter
tmux a