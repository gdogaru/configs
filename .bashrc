# .bashrc

source ~/.git-completion.bash

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
green=$'\e[1;32m'
magenta=$'\e[1;35m'
normal_colours=$'\e[m'
blue=$'\e[0;34m'
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White


function find_git_branch {
    local dir=. head
    until [ "$dir" -ef / ]; do
        if [ -f "$dir/.git/HEAD" ]; then
            head=$(< "$dir/.git/HEAD")
            if [[ $head == ref:\ refs/heads/* ]]; then
                git_branch=" ${head#*/*/}"
            elif [[ $head != '' ]]; then
                git_branch=' (detached)'
            else
                git_branch=' (unknown)'
            fi
            return
        fi
        dir="../$dir"
    done
    git_branch=''
}



export PATH=$PATH:/sbin
# export PS1="\u@\h:\w\n$ "
export PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"
export PS1="\[$blue\]\u@\h:\w\[$magenta\]\$git_branch\[$blue\]\[$normal_colours\]\n$ "


ulimit -S -c 0
set -o notify
export HISTSIZE=5000
export HISTFILESIZE=5000
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s mailwarn
shopt -s sourcepath
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob
shopt -u mailwarn
unset MAILCHECK
export HISTIGNORE="&:bg:fg:ll:h"


alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
#alias which='type -all'
alias ..='cd ..'
alias du='du -kh'
alias df='df -kTh'
alias la='ls -Al'
alias ls='ls -hF --color'
alias ll='ls -l'
alias dir='ll'

alias cdp = 'cd /rhel5pdi/workplace/projects/'

# CVS settings
export CVS_RSH=ssh
export CVSROOT=":ext:$LOGNAME@cvs-software:/src/cvs"

#export JAVA_HOME=/work/apps/jdk1.6.0_33
export JAVA_HOME=/work/apps/jdk1.7.0_03
export IDEA_HOME=$JAVA_HOME
export JDK_HOME=$JAVA_HOME
export IDEA_JDK=/work/apps/jdk1.7.0_03
export ANT_HOME=/work/apps/apache-ant-1.8.4
export MVN_HOME=/work/apps/apache-maven-3.0.4
export M2_HOME=$MVN_HOME
export CATALINA_HOME=/work/apps/apache-tomcat-7.0.29
export TOMCAT_HOME=$CATALINA_HOME
export GROOVY_HOME=/work/apps/groovy-2.0.4
export GRAILS_HOME=/work/apps/grails-2.1.1
export PAGER="less -R"
export ANDROID_HOME=/work/apps/android-sdk-linux

export PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$MVN_HOME/bin:$GRAILS_HOME/bin/:$GROOVY_HOME/bin/:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

#export MANPATH=$MANPATH:/apollo/env/Git/share/man

export P4CONFIG=.p4config


# lines  below are copied from envImprovement dotfile

#################### program environment vars ########################
export CVSROOT=:pserver:$USER@cvs-software:/src/cvs    # make cvs work @ amazon
export CVS_RSH=ssh
export LESS='-i'                # case insensitive searching in less
export MANPATH=$ENV_IMPROVEMENT_ROOT/man:$MANPATH:/usr/kerberos/man
export P4CONFIG=.p4config  # see wiki/?P4CONFIG
export P4EDITOR=$EDITOR        # editor used for perforce forms (submit, etc)
export SCREENRC=$ENV_IMPROVEMENT_ROOT/var/screenrc
export TERMINFO=$ENV_IMPROVEMENT_ROOT/var/terminfo # fix old terminfo settings
export USE_CACHE_WRAPPER=true  #turn on caching for various amazon completions

######################### aliases ####################################
#Don't alias grep until after sourcing the files above, could get bad version
#of grep that doesn't understand --color
alias grep='grep --color=auto'

alias ls='ls --color=auto'
alias ll='ls -lh'

# VI editing mode is a pain to use if you have to wait for <ESC> to register.
# This times out multi-char key combos as fast as possible. (1/100th of a
# second.)
KEYTIMEOUT=1

######################### zsh options ################################
#setopt ALWAYS_TO_END           # Push that cursor on completions.
#setopt AUTO_NAME_DIRS          # change directories  to variable names
#setopt AUTO_PUSHD              # push directories on every cd
#setopt NO_BEEP                 # self explanatory


