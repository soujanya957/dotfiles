#!/bin/bash
# 4-pane tmux template: 2x2 grid

SESSION="your-session-name"
WINDOW="your-window-name"

tmux kill-session -t $SESSION 2>/dev/null
tmux new-session -d -s $SESSION -n $WINDOW

# Wait for window to be ready
while ! tmux list-windows -t $SESSION 2>/dev/null | grep -q $WINDOW; do
  sleep 0.1
done

# Pane 1 (top-left)
tmux send-keys -t $SESSION:1.1 "echo 'Pane 1: your command here'" C-m

# Split right (top-right, Pane 2)
tmux split-window -h -t $SESSION:1.1
tmux send-keys -t $SESSION:1.2 "echo 'Pane 2: your command here'" C-m

# Split bottom (bottom-left, Pane 3)
tmux split-window -v -t $SESSION:1.1
tmux send-keys -t $SESSION:1.3 "echo 'Pane 3: your command here'" C-m

# Split bottom (bottom-right, Pane 4)
tmux split-window -v -t $SESSION:1.2
tmux send-keys -t $SESSION:1.4 "echo 'Pane 4: your command here'" C-m

tmux select-pane -t $SESSION:1.1

if [ -n "$TMUX" ]; then
  tmux switch-client -t $SESSION
else
  tmux attach-session -t $SESSION
fi

# To make this script executable, run:
# chmod +x 4-pane-tmux.sh

