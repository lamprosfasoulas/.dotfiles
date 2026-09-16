notify(){
    local title="Ghostty"
    local message="$*"
    printf '\033Ptmux;\033\033]777;notify;%s;%s\033\\' "${title}" "${message}"
}

curljq() {
    curl "$@" | jq
}

alias vim=nvim
alias ivm=nvim

alias gs='git status'
alias gf='git fetch'

alias ff='firefox --new-tab'
alias ffp='firefox --private-window'

alias ls='gls --color=always'
alias ll='gls --color=always -la'

alias tmux='tmux -u'

alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

alias work='export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES; source ~/work/it/it-ansible/ansible.venv/bin/activate'
alias startproxy='ssh -M -S /tmp/bastille1.sock -D 1080 lfasoula@bastille1.it.auth.gr -fN'
alias stopproxy='ssh -S /tmp/bastille1.sock -O exit lfasoula@bastille1.it.auth.gr'
alias setproxy='export http_proxy=socks5://localhost:1080 https_proxy=socks5://localhost:1080 no_proxy=localhost,127.0.0.1'
alias unsetproxy='unset http_proxy https_proxy no_proxy'

alias k-topics="kafka-topics --bootstrap-server salmoneus-bootstrap.it.auth.gr:9092 --command-config=/Users/lampros/.kafka/k8s.config"
alias k-consumer="kafka-console-consumer --bootstrap-server salmoneus-bootstrap.it.auth.gr:9092 --consumer.config=/Users/lampros/.kafka/k8s.config"
alias k-producer="kafka-console-producer --bootstrap-server salmoneus-bootstrap.it.auth.gr:9092 --producer.config=/Users/lampros/.kafka/k8s.config"
alias k-groups="kafka-consumer-groups --bootstrap-server salmoneus-bootstrap.it.auth.gr:9092 --command-config=/Users/lampros/.kafka/k8s.config"
alias k-acls="kafka-acls --bootstrap-server salmoneus-bootstrap.it.auth.gr:9092 --command-config=/Users/lampros/.kafka/k8s.config"
alias k-config="kafka-configs --bootstrap-server salmoneus-bootstrap.it.auth.gr:9092 --command-config=/Users/lampros/.kafka/k8s.config"

alias k='kubectl'
alias k112='kubectl --context oidc@prod-112'
alias k2='kubectl --context oidc@prod-2'
alias kc='kubectl config'
alias kd='kubectl describe'

complete -F __start_kubectl k
complete -F __start_kubectl k112
complete -F __start_kubectl k2
complete -F __start_kubectl kc
complete -F __start_kubectl kd

alias calicoctl='calicoctl --allow-version-mismatch'
alias t='talosctl'

alias authmail='pop -H $(pass authmail/server) -P $(pass authmail/port) -U $(pass authmail/username) -p $(pass authmail/password)'

alias claude-personal='CLAUDE_CONFIG_DIR=~/.claude-personal claude'
