source $HOME/settings/unix/git-prompt.sh
source $HOME/settings/unix/.bashprompt3
source $HOME/settings/unix/.osx-docker

if [ -e "$HOME/.credentials" ]
then
    source $HOME/.credentials
fi

export GOPATH=$HOME/go
#export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/go
export PATH=$PATH:/usr/local/go/bin:/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$GOROOT/bin:.:$HOME/.cargo/bin

export ETCD_NAME=sh3rp
export ETCD_DATA_DIR=/data/sh3rp.etcd
export ETCD_LISTEN_CLIENT_URLS=http://0.0.0.0:2379
export ETCD_ADVERTISE_CLIENT_URLS=http://0.0.0.0:2379
export ETCDCTL_API=3

export GOOGLE_APPLICATION_CREDENTIALS="$HOME/databox.credentials.json"

shopt -s direxpand

function mem() {
    ps auxww | grep "$1" | awk '{print $4}' | paste -sd+ - | bc
}

function usego() {
    if [ -d "/usr/local/go" ]; then
        sudo rm /usr/local/go
    fi

    VERSION=$1
    OS=$(uname -s | tr A-Z a-z)

    if [ ! -d "/usr/local/go${VERSION}" ]; then
        wget -O /tmp/go.tar.gz https://dl.google.com/go/go${VERSION}.${OS}-amd64.tar.gz
	CWD=$(pwd)
        cd /usr/local
        sudo tar xvfz /tmp/go.tar.gz
        sudo mv /usr/local/go /usr/local/go${VERSION}
        rm /tmp/go.tar.gz
	cd $CWD
    fi

    sudo ln -s /usr/local/go${VERSION} /usr/local/go
}
