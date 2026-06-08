#!/bin/bash
# run.sh
# Blank template: Always creates a new tmux session with 3 panes,
# even if run from inside another tmux session.
# Customize pane commands and session/window names as needed.

SESSION="your-session-name"   # Change this to your desired session name
WINDOW="your-window-name"     # Change this to your desired window name

# Kill any existing session with the same name
tmux kill-session -t $SESSION 2>/dev/null

# Start new session with a shell
tmux new-session -d -s $SESSION -n $WINDOW

# Wait for the window to be ready
while ! tmux list-windows -t $SESSION 2>/dev/null | grep -q $WINDOW; do
  sleep 0.1
done

# Pane 1 (left): Replace with your command
tmux send-keys -t $SESSION:1.1 "echo 'Pane 1: your command here'" C-m

# Split right (vertical) for Pane 2
tmux split-window -h -t $SESSION:1.1
tmux send-keys -t $SESSION:1.2 "echo 'Pane 2: your command here'" C-m

# Split bottom-right (horizontal) for Pane 3
tmux split-window -v -t $SESSION:1.2
tmux send-keys -t $SESSION:1.3 "echo 'Pane 3: your command here'" C-m

# Select left pane on attach
tmux select-pane -t $SESSION:1.1

# Attach to the session (from inside or outside tmux)
if [ -n "$TMUX" ]; then
  tmux switch-client -t $SESSION
else
  tmux attach-session -t $SESSION
fi

# chmod +x run.sh

