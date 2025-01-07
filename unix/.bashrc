#source $HOME/settings/unix/git-prompt.sh
#source $HOME/settings/unix/.bashprompt3
#export PS1="\[\e[0;37m\]\u\[\e[1;97m\]@\[\e[0;37m\]\h \[\e[1;97m\]\W \[\e[1;37m\]> "
export PS1="\[\e[38;5;121m\]\u\[\e[38;5;118m\]@\[\e[38;5;121m\]\h\[\e[38;5;195m\]:\[\e[38;5;85m\]\W \[\e[38;5;123m\]>"
source $HOME/settings/unix/.osx-docker

if [ -e "$HOME/.credentials" ]
then
    source $HOME/.credentials
fi

export GOPATH=$HOME/go
#export GOBIN=$GOPATH/bin
#export GOROOT=/usr/local/go
export PATH=$PATH:$HOME/settings/unix/bin:/usr/local/go/bin:/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$GOROOT/bin:.:$HOME/.cargo/bin
export BAT_THEME="Visual Studio Dark+"

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
