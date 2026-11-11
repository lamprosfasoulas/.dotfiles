LOCAL_PROXY=socks5://127.0.0.1:1080

notify(){
    local title="Ghostty"
    local message="$*"
    printf '\033Ptmux;\033\033]777;notify;%s;%s\033\\' "${title}" "${message}"
}

curljq() { curl "$@" | jq; }

__need_bastion() { ip -4 -o addr show | awk '{split($4,a,"/"); print a[1]}' | grep -qF 155.207.112.204; }
# This is used by ssh config as well in $HOME/.ssh/config
export -f __need_bastion

__proxy() { __need_bastion || echo "$LOCAL_PROXY"; }

flux() { https_proxy=$(__proxy) command flux "$@"; }
k9s() { https_proxy=$(__proxy) command k9s "$@"; }
kubectl() { https_proxy=$(__proxy) command kubectl "$@"; }

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

_kube_alias() {
    local dir=$HOME/.kube/columns

    local before=${COMP_LINE:0:COMP_POINT}
    if [[ $before =~ custom-columns-file=([^[:space:]]*)$ ]]; then
        local typed=${BASH_REMATCH[1]}
        case $typed in
            /*|.*) mapfile -t COMPREPLY < <(compgen -f -- "$typed") ;;
            *)     mapfile -t COMPREPLY < <(compgen -f -- "$dir/$typed") ;;
        esac
        return
    fi
    local orig0=${COMP_WORDS[0]}
    local -a extra=()
    case $orig0 in 
        k112) extra=(--context oidc@prod-112) ;;
        k2) extra=(--context oidc@prod-2) ;;
        kc) extra=(config) ;;
        kd) extra=(describe) ;;
    esac

    local rest=${COMP_LINE#"$orig0"}
    local newprefix="kubectl ${extra[*]}"
    newprefix=${newprefix% }

    COMP_WORDS=(kubectl "${extra[@]}" "${COMP_WORDS[@]:1}")
    (( COMP_CWORD += ${#extra[@]} ))
    COMP_LINE="$newprefix$rest"
    (( COMP_POINT += ${#newprefix} - ${#orig0} ))

    __start_kubectl kubectl
}

for a in k k112 k2 kc kd; do 
    complete -o default -F _kube_alias "$a"
done

alias calicoctl='calicoctl --allow-version-mismatch'
alias t='talosctl'

alias authmail='pop -H $(pass authmail/server) -P $(pass authmail/port) -U $(pass authmail/username) -p $(pass authmail/password)'

alias claude-personal='CLAUDE_CONFIG_DIR=~/.claude-personal claude'
