source $HOME/settings/unix/git-prompt.sh
source $HOME/settings/unix/.bashprompt2
source $HOME/settings/unix/.osx-docker

if [ -e "$HOME/.credentials" ]
then
    source $HOME/.credentials
fi

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/go
export PATH=$PATH:/usr/local/go/bin:/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$GOROOT/bin

export ETCD_NAME=sh3rp
export ETCD_DATA_DIR=/data/sh3rp.etcd
export ETCD_LISTEN_CLIENT_URLS=http://0.0.0.0:2379
export ETCD_ADVERTISE_CLIENT_URLS=http://0.0.0.0:2379
export ETCDCTL_API=3
