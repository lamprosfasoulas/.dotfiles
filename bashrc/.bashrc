
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
. ~/.git-completion.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000


#turns off login warning
export BASH_SILENCE_DEPRECATION_WARNING=1

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#turns on ls coloring
export CLICOLOR=1
#export LSCOLORS=$(LS_COLORS=ExGxBxDxCxEgEdxbxgxcxd)
alias ls='gls --color=always'
#alias ll='ls -lG'
#sets color for prompt
export GPG_TTY=$(tty)

alias vim=nvim
alias tmux='tmux -u'
alias sftpd='sftp lampros@desktop'
alias wakedesk='wakeonlan -i 10.17.17.255 b8:2a:72:b0:df:15'

alias work='source ~/work/it-ansible/ansible.venv/bin/activate'
alias k='kubectl'
alias kd='kubectl describe'

bind '"\C-f":"tmux-sessionizer\n"'

eval "$(starship init bash)"
eval "$(fzf --bash)"

. "$HOME/.cargo/env"
