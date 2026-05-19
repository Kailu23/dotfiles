path=~/.config/bashrc/*.sh

for file in $path; do
    [ -r "$file" ] && source "$file"
done

if [[ $OSTYPE == linux* ]]; then
    # If not running interactively, don't do anything (leave this at the top of this file)
    [[ $- != *i* ]] && return

    # All the default Omarchy aliases and functions
    # (don't mess with these directly, just overwrite them here!)
    source ~/.local/share/omarchy/default/bash/rc

    # Add your own exports, aliases, and functions here.
    #
    # Make an alias for invoking commands you use constantly
    # alias p='python'
    export NVM_DIR="$HOME/.config/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

    export SSH_AUTH_SOCK="/run/user/$(id -u)/ssh-agent.socket"

    if ssh-add -l &>/dev/null; then
        ssh-add ~/.ssh/id_ed25519 &>/dev/null
    fi
fi