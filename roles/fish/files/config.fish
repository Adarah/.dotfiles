########################################
# My alternative commands to break muscle memory
########################################
function alternative
    # Prints bold red message
    set_color -ob red
    if [ (count $argv) -eq 2 ]
        echo "Use $argv[1] ($argv[2]) instead." >&2
    else
        echo "Use $argv[1] instead." >&2
    end
    set_color normal
end

function cat
    alternative bat
    command cat $argv
end

# zoxide actually uses cd under the hood, so this message shows up even when using zoxide
# function cd
    # alternative zoxide z
    # command cd $argv
# end

function curl
    alternative httpie http
    command curl $argv
end

function df
    alternative duf
    command df $argv
end

function du
    alternative dust
    command du $argv
end

function find
    alternative fd
    command find $argv
end

function grep
    alternative ripgrep rg
    command grep $argv
end

function htop
    alternative bottom btm
    command htop $argv
end

function ls
    alternative exa
    command ls $argv
end

function ps
    alternative procs
    command ps $argv
end

function tree
    alternative broot
    command tree $argv
end


########################################
# zoxide
# sources: https://github.com/ajeetdsouza/zoxide#fish
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
set PATH /var/lib/snapd/snap/bin $PATH
set XDG_DATA_DIRS /var/lib/snapd/desktop/:$XDG_DATA_DIRS