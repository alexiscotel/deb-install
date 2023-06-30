# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi
# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


### PERSONNAL CONFIGURATION for user root (generate by prettier-shell script)
# OS Distribution name
get_os_name ()
{
    FILE=/etc/os-release;
    if test -f "$FILE"; then
        awk -F= '$1=="ID" { print " "$2 ;}' "$FILE";
    fi
}
# git branch
parse_git_branch ()
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
# host ip
get_host_ip ()
{
    echo "$(last -i | head -n 1 | awk '{print $3}')"
}
# PROFILE root
PS1='\[\e[38;5;251;1m\]\A\[\e[0m\]\[\e[38;5;230;2m\]$(get_os_name)\[\e[0m\] \[\e[38;5;160;1;5m\]\u\[\>💥 '
### END PERSONNAL CONFIGURATION