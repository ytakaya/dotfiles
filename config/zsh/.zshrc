# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### zinit ###
# typeset -gAH ZINIT
# ZINIT[HOME_DIR]="$XDG_DATA_HOME/zinit"
# ZINIT[ZCOMPDUMP_PATH]="$XDG_STATE_HOME/zcompdump"
# source "${ZINIT[HOME_DIR]}/bin/zinit.zsh"
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

### paths ###
typeset -U path
typeset -U fpath

path=(
    "$HOME/.local/bin"(N-/)
    "$HOME/.local/share/flutter/bin"(N-/)
    "$GOPATH/bin"(N-/)
    "$JAVA_HOME/bin"(N-/)
    "$XDG_CONFIG_HOME/scripts/bin"(N-/)
    "${KREW_ROOT:-$HOME/.krew}/bin"(N-/)
    "$path[@]"
)

fpath=(
    "$XDG_DATA_HOME/zsh/completions"(N-/)
    "$fpath[@]"
)

### history ###
export HISTFILE="$XDG_STATE_HOME/.zsh_history"
export HISTSIZE=12000
export SAVEHIST=10000

setopt SHARE_HISTORY
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt GLOBDOTS
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt INTERACTIVE_COMMENTS
setopt NO_SHARE_HISTORY
setopt MAGIC_EQUAL_SUBST
setopt PRINT_EIGHT_BIT
setopt NO_FLOW_CONTROL

zshaddhistory() {
    local line="${1%%$'\n'}"
    [[ ! "$line" =~ "^(cd|history|jj?|lazygit|la|ll|ls|rm|rmdir|trash)($| )" ]]
}

### theme ###
zinit ice depth"1"
zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

### plugins ###
zinit wait lucid null for \
    atinit'source "$ZDOTDIR/.zshrc.lazy"' \
    atinit'source "$ZDOTDIR/.zshrc.fzf.lazy"' \
    @'zdharma-continuum/null'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yamazoe/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yamazoe/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yamazoe/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yamazoe/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
