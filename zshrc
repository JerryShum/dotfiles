# --- Completion (Tab: commands, git branches, file paths, flags) ---
autoload -Uz compinit && compinit

# --- Inline history-based suggestions (grey ghost text, press → to accept) ---
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- Smarter cd: `z <dir>` jumps to your most-used directories ---
eval "$(zoxide init zsh)"

# --- Syntax highlighting (MUST be sourced last) ---
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
