if [ -x $(command -v zsh) ]; then
  export SHELL="/bin/zsh"
fi

if [ -x $(command -v tmux) ]; then
  exec tmux attach
fi
