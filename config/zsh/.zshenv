### locale ###
export LANG="en_US.UTF-8"

### XDG ###
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

### zsh ###
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

### brew ###
eval "$(/opt/homebrew/bin/brew shellenv)"

### Go ###
export GOPATH="$XDG_DATA_HOME/go"
export GO111MODULE="on"

### JAVA ###
export JAVA_HOME="$XDG_DATA_HOME/java/temurin-17.jdk/Contents/Home"

### NODE ###
export NVM_DIR="$XDG_DATA_HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
