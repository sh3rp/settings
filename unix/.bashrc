#source $HOME/settings/unix/git-prompt.sh
#source $HOME/settings/unix/.bashprompt3
export PS1="\[\e[0;37m\]\u\[\e[1;30m\]@\[\e[0;37m\]\h \[\e[1;30m\]\W \[\e[1;37m\]> "
source $HOME/settings/unix/.osx-docker

if [ -e "$HOME/.credentials" ]
then
    source $HOME/.credentials
fi

export GOPATH=$HOME/go
#export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/go
export PATH=$PATH:$HOME/settings/unix/bin:/usr/local/go/bin:/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$GOROOT/bin:.:$HOME/.cargo/bin

export ETCD_NAME=sh3rp
export ETCD_DATA_DIR=/data/sh3rp.etcd
export ETCD_LISTEN_CLIENT_URLS=http://0.0.0.0:2379
export ETCD_ADVERTISE_CLIENT_URLS=http://0.0.0.0:2379
export ETCDCTL_API=3

export GOOGLE_APPLICATION_CREDENTIALS="$HOME/databox.credentials.json"

#shopt -s direxpand

alias cat=$(which bat)
alias find=$(which fd)
alias hat=$(which hexyl)
alias grep=$(which rg)
alias ls=$(which exa)
alias ps=$(which procs)


alias tfi="terraform init"
alias tfv="terraform validate"
alias tfa="terraform apply -auto-approve"
alias tfd="terraform destroy"

function mem() {
    ps auxww | grep "$1" | awk '{print $4}' | paste -sd+ - | bc
}

function gitprofile() {
    if [[ "$1" ]]; then
       rm -f $HOME/.gitconfig
       ln -s $HOME/.gitconf/$1 $HOME/.gitconfig
    fi
    git config -l
}
