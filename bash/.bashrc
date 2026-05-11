notify(){
    local title="Ghostty"
    local message="$*"
    printf '\033Ptmux;\033\033]777;notify;%s;%s\033\\' "${title}" "${message}"
}

curljq() {
    curl "$@" | jq
}

[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

HISTSIZE=1000
HISTFILESIZE=2000

export VAULT_ADDR=https://vault.it.auth.gr:8200 
# export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"

[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

bind '"\C-f":"tmux-sessionizer\n"'

export GPG_TTY=$(tty)
eval "$(starship init bash)"
eval "$(fzf --bash)"
