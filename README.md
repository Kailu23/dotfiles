# MY DOTFILES
My dotfiles for the Bash Shell, git, WezTerm and Neovim.
Currently I only have Neovim as a submodule.

## Clone submodules
```
git clone https://github.com/Kailu23/dotfiles ~/.config/ && \
cd ~/.config/ && \
git pull --recurse-submodules && \
git submodule update --init --recursive
``` 

## Submodules

The `dotfiles` repository contains a `.config` diretory which doesn't contain any code.
It points to `submodules` which are independent repositories.

```
git pull --recurse-submodules && \
git submodule update --init --recursive
```

This ensures that `dotfiles/.config/<submodule>` actually contains files because without those lines the diretories would be empty.
For now only `dotfiles/.config/nvim/` submodule exists here.

## .bashrc

This is my `.bashrc` configuration which takes individual configuration files from `dotfiles/.config/bashrc/` 

The individual files are:
-  [apps.sh](./.config/bashrc/apps.sh)
    - makes aliases of Android Studio, VS Code and Neovim
- [ssh-agent.sh](./.config/bashrc/ssh-agent.sh)
    - start OpenSSH when I'm signing commits
- [tab-completion.sh](./.config/bashrc/tab-completion.sh)
    - enables tab completion for .NET CLI
- [visualstudio.sh](./.config/bashrc/visualstudio.sh)
    - this is a function which searches for a .sln/.slnx file and opens it with Visual Studio

## .gitconfig

This contains my config for the git workflow. Notables are: 

- [aliases.conf](./.config/git/aliases.conf)
    - contains aliases for git log, currently has 3 different git lg's
- [delta.conf](./.config/git/delta.conf)
    - contains config for delta which is a pager (syntax highlighther) for git diff, merge and grep output
- signingkey.conf
    - this exists mainly so I can work on multiple workstations without having to change my signingkey
    - it's in .gitignore so no link to file
- editor/tool is neovim
- mergetool is nvimdiff2
    - nvimdiff2 produces a vertical 3 way split
        1. left are the local changes
        2. middle are the merged changes
        3. right are the remote changes

## dotfiles/.config/wezterm/wezterm.lua

Config for WezTerm terminal emulator. I use it because it supports emojis and is cross-platform.

Config file is located in `dotfiles/.config/wezterm/` and for it to be found by WezTerm `$WEZTERM_CONFIG_FILE` 
enviroment variable has to be set to the desired path.

On Windows I set it to `%USERPROFILE%/.config/wezterm`. UNIX equivalent would be `$HOME/.config/wezterm/` 

## .editorconfig

This contains my formatting options for C#. It was taken from VS once I set it up to my liking.
