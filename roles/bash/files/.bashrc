# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

########################################
# My environment variables
########################################
export EDITOR=$(which nvim)

########################################
# My aliases
########################################
alias sudo='sudo '
alias vi='nvim'
alias gb='git branch'
alias gs='git status'
alias ga='git add'
alias gc='git commit -S'
alias gca='git commit -S --amend'
alias gp='git push'
alias gpf='git push --force-with-lease --force-if-includes'
alias gl='git log'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

########################################
# Pyenv
# source: https://github.com/pyenv/pyenv
########################################
# setting to setup shims
eval "$(pyenv init -)"
# setting to load virtualenvs automatically
eval "$(pyenv virtualenv-init -)"

########################################
# GPG Agent
# sources: https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
########################################
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
