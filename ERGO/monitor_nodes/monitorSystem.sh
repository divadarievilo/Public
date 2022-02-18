#!/bin/bash
# Start Tmux Session
tmux new-session -d -s SystemMonitoring

# Create 3 panes (1 big horizontal, 2 small vertical)
tmux split-window -v -t SystemMonitoring:0
tmux split-window -h -t SystemMonitoring:0.0

# Open Cardano Node Monitor, HTOP and Ergo Node Monitor
# NOTE: Change paths accordingly.
tmux send-keys -t SystemMonitoring:0.0 "cd $CNODE_HOME/scripts ; ./gLiveView.sh" Enter
tmux send-keys -t SystemMonitoring:0.1 "htop" Enter
tmux send-keys -t SystemMonitoring:0.2 "journalctl -u enode.service -f" Enter

# Enter the Txmux Session
tmux a