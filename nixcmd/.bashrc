
export USER_LOGNAME=`/usr/bin/logname`
export HISTDIR=~/.history
export MAIL=/usr/mail/${LOGNAME:?}
export MAILER=mailx
export PAGER=more
export NIXENV_HOME=`echo ~`
export NIXENV_ENV=${NIXENV_HOME}/.nixenv

################# Histfile
if [ ! -d ${HISTDIR} ]; then
	mkdir ${HISTDIR}
fi

#export BLOCKSIZE=K
#export CDPATH=.:$HOME
export EDITOR=vi
export VISUAL=${EDITOR}

shopt -s histappend 
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=100000
HISTFILESIZE=200000

export HISTEDIT=${EDITOR}
export HISTFILE=${HISTDIR}/.histfile_$$.log

shopt -s checkwinsize

set -o ${EDITOR}
umask 000

C_DBLUE='\[\033[0;34m\]'
C_LBLUE='\[\033[1;34m\]'
C_D_RED='\[\033[0;31m\]'
C_L_RED='\[\033[1;31m\]'
C_LCYAN='\[\033[1;36m\]'
C_DCYAN='\[\033[0;36m\]'
C_NONE='\[\e[0m\]'

case "$TERM" in
  xterm-color) color_prompt=yes;;
esac


function setPrompt() {
    previous_return_value=$?;
    
    prompt="${TITLEBAR}${C_LBLUE}[${C_LCYAN}\u${C_LBLUE}@${C_LCYAN}\h${C_LBLUE}:${C_L_RED}\w${C_LBLUE}]"
    if test $previous_return_value -eq 0
    then
        PS1="${prompt}${C_DCYAN}> #${C_NONE} "
    else
        PS1="${prompt}${C_D_RED}Error${C_DCYAN}> #${C_NONE} "
    fi
}


PROMPT_COMMAND=setPrompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
     alias ls='ls --color=auto'
     alias grep='grep --color=auto'
     alias fgrep='fgrep --color=auto'
     alias egrep='egrep --color=auto'
     alias r='fc -e -'
fi

export TERM=xterm-256color

export USERMZ=${NIXENV_ENV}rc
if [ -f ${USERMZ} ]; then
    . ${USERMZ}
else
    unset  USERMZ
fi

########################### Env
#PATH=$PATH:$HOME/bin

#export JAVA_HOME=

#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:

#export ORACLE_HOME=
#export ORACLE_SID=
#export ORACLE_DATA=

#export PATH=
#export MANPATH=

alias dir='ls -lA'

