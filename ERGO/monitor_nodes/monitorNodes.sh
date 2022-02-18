#!/bin/bash
# Start Tmux Session
tmux new-session -d -s NodeMonitoring

# Create 2 panes (horizontal split)
tmux split-window -h -t NodeMonitoring:0

# Open Cardano Node Monitor and Ergo Node Monitor
# NOTE: Change paths accordingly.
tmux send-keys -t NodeMonitoring:0.0 "cd $CNODE_HOME/scripts ; ./gLiveView.sh" Enter
tmux send-keys -t NodeMonitoring:0.1 "journalctl -u enode.service -f" Enter

# Enter the Txmux Session
tmux a