
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/go/bin"

#turns off login warning
export BASH_SILENCE_DEPRECATION_WARNING=1

#turns on ls coloring
export CLICOLOR=1
#alias ls='ls -G'
#alias ll='ls -lG'
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
#sets color for prompt
export GPG_TTY=$(tty)

alias vim=nvim
alias tmux='tmux -u'
alias sftpd='sftp lampros@desktop'
alias wakedesk='wakeonlan -i 10.17.17.255 b8:2a:72:b0:df:15'

bind '"\C-f":"tmux-sessionizer\n"'

eval "$(starship init bash)"
eval "$(fzf --bash)"
