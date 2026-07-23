ZSH_THEME="macovsky"
plugins=(
    git
    azure
    zsh-autosuggestions
    )

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

for zsh_file in ~/.config/zsh/*.zsh(N); do
    [ -r "$zsh_file" ] && source "$zsh_file"
done

DISABLE_AUTO_UPDATE="true"

autoload -Uz compinit
_zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"

compaudit() { return 0 }

if [[ -s "$_zcompdump" ]]; then
    compinit -C -d "$_zcompdump"
else
    compinit -d "$_zcompdump"
fi

# functions -c compinit _real_compinit
# compinit() { _real_compinit -C "$@" }

source $ZSH/oh-my-zsh.sh

unfunction compinit compaudit
autoload -Uz compinit compaudit
unset _zcompdump

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

USE_POWERLINE="true"
HAS_WIDECHARS="false"

if (( $+commands[wezterm] )) || [[ -n "$WEZTERM_PANE" ]]; then
    autoload -Uz add-zsh-hook
    _wezterm_osc7() {
        local osc_pwd="$PWD"
        if (( $+commands[cygpath] )); then
            osc_pwd=$(cygpath -m "$PWD")
        fi
        printf '\e]7;file://%s%s\e\\' "$HOST" "$osc_pwd"
    }
    add-zsh-hook precmd _wezterm_osc7
fi

if [[ $OSTYPE == linux* ]]; then
    [[ $- != *i* ]] && return
    source ~/.local/share/omarchy/default/bash/rc
    export NVM_DIR="$HOME/.config/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    export SSH_AUTH_SOCK="/run/user/$(id -u)/ssh-agent.socket"
    ssh-add -l &>/dev/null
    status=$?
    if [[ $status -eq 1 ]]; then
        ssh-add ~/.ssh/id_ed25519
    fi
fi

