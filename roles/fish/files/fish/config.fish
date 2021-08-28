########################################
# Native fish options
########################################
# Enable vi mode
fish_vi_key_bindings

########################################
# My aliases
########################################
alias k 'kubectl'
alias vi 'nvim'
alias gb 'git branch'
alias gs 'git status'
alias ga 'git add'
alias gc 'git commit -S'
alias gca 'git commit -S --amend'
alias gp 'git push'
alias gpf 'git push --force-with-lease --force-if-includes'
alias gl 'git log'
alias icat="kitty +kitten icat"

########################################
# My alternative commands to break muscle memory
########################################
function alternative
    # Prints bold red message
    set_color -ob red
    if [ (count $argv) -eq 2 ]
        echo "Try using $argv[1] ($argv[2]) instead." >&2
    else
        echo "Try using $argv[1] instead." >&2
    end
    set_color normal
end

alias cat "alternative bat; command cat"
alias curl "alternative httpie http; command curl"
alias df "alternative duf; command df"
alias du "alternative dust; command du"
alias find "alternative fd; command find"
alias grep "alternative rg; command grep"
alias htop "alternative bottom btm; command htop"
alias ls "alternative exa; command ls"
alias ps "alternative procs; command ps"
alias tree "alternative broot br; command tree"


########################################
# zoxide
# source: https://github.com/ajeetdsouza/zoxide#fish
########################################
zoxide init fish | source


########################################
# Pyenv
# source: https://github.com/pyenv/pyenv#basic-github-checkout
########################################
status is-login; and pyenv init --path | source
pyenv init - | source


########################################
# Poetry
# source: https://python-poetry.org/docs/#installation
########################################
set PATH $PATH ~/.poetry/bin


########################################
# GPG Agent
# sources:
# - https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
# - https://gist.github.com/mcattarinussi/834fc4b641ff4572018d0c665e5a94d3
########################################
set SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
set GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye >/dev/null


########################################
# Enable Snap packages in the fish shell
########################################
set PATH /var/lib/snapd/snap/bin /usr/sbin/ $PATH
set XDG_DATA_DIRS /var/lib/snapd/desktop/:$XDG_DATA_DIRS


########################################
# Add Flatpak paths to XDG_DATA_DIR
########################################
set XDG_DATA_DIRS /var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS


########################################
# nvm
# source: https://github.com/edc/bass#nvm
########################################
set NVM_DIR "$HOME/.nvm"
function nvm
    bass source "$NVM_DIR/nvm.sh"  --no-use ';' nvm $argv
end
# nvm use node --silent
