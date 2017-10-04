source $HOME/settings/unix/.bashprompt
source $HOME/settings/unix/.osx-docker

if [ -e "$HOME/.credentials" ]
then
    source $HOME/.credentials
fi

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/go
export PATH=$PATH:/usr/local/go/bin:/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$GOROOT/bin
