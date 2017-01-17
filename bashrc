# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#export TERM=xterm-256color
export JAVA_HOME=/home/mren/Programs/java/jdk1.8.0_51
export GNUMPY_USE_GPU=no

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

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH=$PATH:$HOME/bin:/home/mren/Programs/java/jdk1.8.0_51/bin:/home/mren/Programs/pycharm-community-4.5.3/bin:/home/mren/third_party/Markdown_1.0.1:/usr/local/MATLAB/R2014a/bin

. /home/mren/torch/install/bin/torch-activate
export LD_LIBRARY_PATH=$HOME/code/img-count/lib:/opt/OpenBLAS/lib:/home/mren/torch/install/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$HOME/code/tfplus:$PYTHONPATH

alias apps0='ssh apps0.cs.toronto.edu'
alias cluster1='ssh -t apps0.cs.toronto.edu ssh cluster1.ais.sandbox'
alias cluster2='ssh -t apps0.cs.toronto.edu ssh cluster2.ais.sandbox'
alias cluster3='ssh -t apps0.cs.toronto.edu ssh cluster3.ais.sandbox'
alias cluster4='ssh -t apps0.cs.toronto.edu ssh cluster4.ais.sandbox'
alias cluster5='ssh -t apps0.cs.toronto.edu ssh cluster5.ais.sandbox'
alias cluster6='ssh -t apps0.cs.toronto.edu ssh cluster6.ais.sandbox'
alias cluster7='ssh -t apps0.cs.toronto.edu ssh cluster7.ais.sandbox'
alias cluster8='ssh -t apps0.cs.toronto.edu ssh cluster8.ais.sandbox'
alias cluster9='ssh -t apps0.cs.toronto.edu ssh cluster9.ais.sandbox'
alias cluster10='ssh -t apps0.cs.toronto.edu ssh cluster10.ais.sandbox'
alias cluster11='ssh -t apps0.cs.toronto.edu ssh cluster11.ais.sandbox'
alias cluster12='ssh -t apps0.cs.toronto.edu ssh cluster12.ais.sandbox'
alias cluster57='ssh -t apps0.cs.toronto.edu ssh cluster57.ais.sandbox'
alias cluster61='ssh -t apps0.cs.toronto.edu ssh cluster61.ais.sandbox'
alias cluster62='ssh -t apps0.cs.toronto.edu ssh cluster62.ais.sandbox'
alias guppy='ssh -t apps0.cs.toronto.edu ssh guppy.ais.sandbox'
alias guppy1='ssh -t apps0.cs.toronto.edu ssh guppy1.ais.sandbox'
alias guppy2='ssh -t apps0.cs.toronto.edu ssh guppy2.ais.sandbox'
alias guppy3='ssh -t apps0.cs.toronto.edu ssh guppy3.ais.sandbox'
alias guppy4='ssh -t apps0.cs.toronto.edu ssh guppy4.ais.sandbox'
alias guppy5='ssh -t apps0.cs.toronto.edu ssh guppy5.ais.sandbox'
alias guppy6='ssh -t apps0.cs.toronto.edu ssh guppy6.ais.sandbox'
alias guppy7='ssh -t apps0.cs.toronto.edu ssh guppy7.ais.sandbox'
alias guppy8='ssh -t apps0.cs.toronto.edu ssh guppy8.ais.sandbox'
alias guppy9='ssh -t apps0.cs.toronto.edu ssh guppy9.ais.sandbox'
alias guppy10='ssh -t apps0.cs.toronto.edu ssh guppy10.ais.sandbox'
alias guppy11='ssh -t apps0.cs.toronto.edu ssh guppy11.ais.sandbox'
alias guppy12='ssh -t apps0.cs.toronto.edu ssh guppy12.ais.sandbox'
alias guppy13='ssh -t apps0.cs.toronto.edu ssh guppy13.ais.sandbox'
alias guppy14='ssh -t apps0.cs.toronto.edu ssh guppy14.ais.sandbox'
alias guppy15='ssh -t apps0.cs.toronto.edu ssh guppy15.ais.sandbox'
alias guppy16='ssh -t apps0.cs.toronto.edu ssh guppy16.ais.sandbox'
alias guppy17='ssh -t apps0.cs.toronto.edu ssh guppy17.ais.sandbox'
alias vpn='cd ~/Documents/vpn;sudo openvpn --config cslab.ovpn'
alias matlabno='matlab -nodesktop -nosplash'
alias mount='sshfs mren@cs.toronto.edu:/u/mren/ ~/cslab-home'
alias unmount='fusermount -u ~/cslab-home'
alias mountgobi3='sshfs mren@cluster1.ais.sandbox:/ais/gobi3/u/mren/ ~/cslab-gobi3'
alias unmountgobi3='fusermount -u ~/cslab-gobi3'
alias mountgobi4='sshfs mren@cluster1.ais.sandbox:/ais/gobi4/mren/ ~/cslab-gobi4'
alias unmountgobi4='fusermount -u ~/cslab-gobi4'
alias mountcdf='sshfs t5renmen@cdf.toronto.edu:/h/u6/t5/00/t5renmen/ ~/cdf-t5renmen'
alias unmountcdf='fusermount -u ~/cdf-t5renmen'
alias mountteach='sshfs renmengy@teach.cs.toronto.edu:/h/u10/c4/00/renmengy/ ~/teach-renmengy'
alias unmountteach='fusermount -u ~/teach-renmengy'
