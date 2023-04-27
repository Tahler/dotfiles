if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

export PATH="/snap/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOBIN:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/bin:$PATH"
