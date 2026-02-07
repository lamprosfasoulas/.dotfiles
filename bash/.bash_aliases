alias vim=nvim
alias ivm=nvim

alias gs='git status'
alias gf='git fetch'

alias ff='firefox --new-tab'
alias ffp='firefox --private-window'

alias ls='gls --color=always'
alias ll='gls --color=always -la'

alias tmux='tmux -u'

alias work='source ~/work/it-ansible/ansible.venv/bin/activate'
alias setproxy='export http_proxy=socks5://localhost:1080 https_proxy=socks5://localhost:1080 no_proxy=localhost,127.0.0.1'
alias unsetproxy='unset http_proxy https_proxy no_proxy'

alias k='kubectl'
alias kc='kubectl config'
alias kd='kubectl describe'

alias calicoctl='calicoctl --allow-version-mismatch'
alias t='talosctl'

alias expvault='export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES; export VAULT_ADDR=https://vault.it.auth.gr:8200'
alias authmail='pop -H $(pass authmail/server) -P $(pass authmail/port) -U $(pass authmail/username) -p $(pass authmail/password)'
