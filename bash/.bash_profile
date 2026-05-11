if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lampros/personal/adventofcode/2025/google-cloud-sdk/path.bash.inc' ]; then . '/Users/lampros/personal/adventofcode/2025/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lampros/personal/adventofcode/2025/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/lampros/personal/adventofcode/2025/google-cloud-sdk/completion.bash.inc'; fi

export BASH_SILENCE_DEPRECATION_WARNING=1

# PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"

export BUN_INSTALL="$HOME/.bun"
export CLICOLOR=1


eval "$(/opt/homebrew/bin/brew shellenv bash)"
