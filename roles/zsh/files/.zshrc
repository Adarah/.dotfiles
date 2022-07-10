# Allows using brew in a non-admin account
alias brew='sudo -Hu brew brew'

# Enables asdf shims
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Allows using gpg as your ssh agent
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Adds pip3 installed ansible to path
export PATH="$PATH:$HOME/Library/Python/3.9/bin"

# enable zoxide
# eval "$(zoxide init zsh)"

# My aliases
alias vi='nvim'
alias gb='git branch'
alias gs='git status'
alias ga='git add'
alias gc='git commit -S'
alias gca='git commit -S --amend'
alias gp='git push'
alias gpf='git push --force-with-lease --force-if-includes'
alias gl='git log'
alias gr='git rebase --exec "git commit --amend --no-edit -n -S" -i main'


GOV=$(asdf where golang)
export GOROOT=$GOV/go
