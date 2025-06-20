export CLICOLOR=1

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
export TZ="America/Halifax"

#############################
#bash shortcuts
alias ll='ls -lh'
alias lt='ls -lth'
alias la="ls -a"
alias lr="ls -ltr"

alias q='qstat'
alias sq='squeue -o"%.18i %.9P %.16j %.8u %.8T %.10M %C %.6D %R"'
alias watchq="watch -n 60 'squeue -o\"%.18i %.9P %.16j %.8u %.8T %.10M %C %.6D %R\"'"
alias push='git push -u origin `git branch | awk "/\*/ {print \\\$2}"`'
alias storage="df -Th"
alias folder_size="du --summarize --human-readable *"

alias ipy='ipython'
