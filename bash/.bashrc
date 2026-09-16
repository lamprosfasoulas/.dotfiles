HISTSIZE=1000
HISTFILESIZE=2000

export BASH_SILENCE_DEPRECATION_WARNING=1

eval "$(/opt/homebrew/bin/brew shellenv bash)"
eval "$(starship init bash)"
eval "$(fzf --bash)"

# PATH
export BUN_INSTALL="$HOME/.bun"

export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"

export CLICOLOR=1

export VAULT_ADDR=https://vault.it.auth.gr:8200 
export GPG_TTY=$(tty)


[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && source "/opt/homebrew/etc/profile.d/bash_completion.sh"

bind '"\C-f":"tmux-sessionizer\n"'
