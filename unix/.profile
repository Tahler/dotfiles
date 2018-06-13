export GOPATH=$HOME/go
CARGO_BIN=$HOME/.cargo/bin
YARN_BIN=$HOME/.yarn/bin
CUDA_BIN=/usr/local/cuda-9.0/bin
CABAL_BIN=$HOME/.cabal/bin
export PATH=$HOME/bin:/usr/local/bin:/usr/local/go/bin:$GOPATH/bin:$CABAL_BIN:$YARN_BIN:$CARGO_BIN:$PATH

export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

export ISTIO=$GOPATH/src/istio.io # eg. ~/go/src/istio.io

# The Istio Docker build system will build images with a tag composed of
# $USER and timestamp. The codebase doesn't consistently use the same timestamp
# tag. To simplify development the development process when later using
# updateVersion.sh you may find it helpful to set TAG to something consistent
# such as $USER.
export TAG=$USER

export GITHUB_USER=Tahler

# Specify which Kube config you'll use for testing. This depends on whether
# you're using Minikube or your own Kubernetes cluster for local testing
# For a GKE cluster:
export KUBECONFIG=${HOME}/.kube/config
# Alternatively, for Minikube:
# export KUBECONFIG=${GOPATH}/src/istio.io/istio/.circleci/config

