#!/bin/sh
#
# Setup tmux pans for kenshoo work
#
# Based on -
#   https://gist.github.com/todgru/6224848
#   https://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened

# session="work"

# tmux start-server

# tmux new-session -d -s $session -n venvs -c ~/repos
# tmux send-keys "cowsay Dont forget to type venv" C-m

# tmux new-window -t $session:2 -n ipython \; send-keys 'ipython3' Enter

# tmux new-window -t $session:3 -n servers
# tmux selectp -t 1
# tmux splitw -v -p 50

# tmux new-window -t $session:4 -n terminal
# tmux send-keys "cowsay Good day to ya sir" C-m

# tmux attach-session -t $session


session="kenshoo"

tmux start-server

tmux new-session -d -s $session -n profit -c ~/repos/optimization-supervisor \; send-keys 'venv' Enter

tmux new-window -t $session:2 -n ipython \; send-keys 'ipython3' Enter

tmux new-window -t $session:3 -n research_incubation -c ~/repos/research-incubation/profit_gp \; send-keys 'venv' Enter

tmux new-window -t $session:4 -n BAP -c ~/Documents/scripts/BAP \; send-keys 'venv' Enter

tmux new-window -t $session:5 -n dashboard -c ~/repos/optimization-dashboard \; send-keys 'venv' Enter

tmux new-window -t $session:6 -n terminal
tmux send-keys "cowsay Good day to ya sir" C-m

tmux attach-session -t $session
