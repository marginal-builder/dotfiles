# Interactive shell config

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export EDITOR=nvim
export VISUAL=nvim

# Homebrew (also set in .zprofile for login shells)
if ! command -v brew > /dev/null 2>&1; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# zoxide
command -v zoxide > /dev/null 2>&1 && eval "$(zoxide init zsh)"

# mise
command -v mise > /dev/null 2>&1 && eval "$(mise activate zsh)"

# zsh-syntax-highlighting
ZSH_HIGHLIGHTING="$(brew --prefix 2> /dev/null)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f "$ZSH_HIGHLIGHTING" ] && source "$ZSH_HIGHLIGHTING"

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups share_history

# Aliases
alias vim=nvim
alias vi=nvim
alias ll='ls -lah'
alias la='ls -A'
alias ..='cd ..'

# Used by the tmux bindings in ~/.config/tmux/tmux.conf
terminal_window() {
    local size="${1:-medium}" width height
    case "$size" in
        small) width=900; height=600 ;;
        large) width=1600; height=1000 ;;
        *) width=1200; height=800 ;;
    esac
    osascript -e "tell application \"System Events\" to tell process \"Ghostty\" to set size of front window to {$width, $height}" \
        > /dev/null 2>&1 || true
}
