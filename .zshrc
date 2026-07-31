ZSH_THEME="macovsky"
plugins=(
    git
    azure
    zsh-autosuggestions
    zsh-syntax-highlighting
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

eval "$(starship init zsh)"

eval "$(dircolors -b)"
alias ls='eza -al --color=always --group-directories-first --icons=always' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons=always'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons=always'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons=always' # tree listing
alias l.="eza -a | grep -e '^\.'"                                     # show only dotfiles
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

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
    export SSH_AUTH_SOCK="/run/user/$(id -u)/ssh-agent.socket"
    ssh-add -l &>/dev/null
    ssh_status=$?
    if [[ $ssh_status -eq 1 ]]; then
        ssh-add ~/.ssh/id_ed25519
    fi
fi


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
