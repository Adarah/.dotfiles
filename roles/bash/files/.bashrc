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
alias vi='nvim'
alias gb='git branch'
alias gs='git status'
alias ga='git add'
alias gc='git commit -S'
alias gca='git commit -S --amend'
alias gp='git push'
alias gpf='git push --force-with-lease --force-if-includes'
alias gl='git log'


########################################
# zoxide
# sources: https://github.com/ajeetdsouza/zoxide#bash
########################################
eval "$(zoxide init bash)"


########################################
# GPG Agent
# sources:
# - https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
# - https://gist.github.com/mcattarinussi/834fc4b641ff4572018d0c665e5a94d3
########################################
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
