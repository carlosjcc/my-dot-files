# Enable tab completion
source ~/git-completion.bash

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/git-prompt.sh
#export GIT_PS1_SHOWDIRTYSTATE=1
## '\u' adds the name of the current user to the prompt
## '\$(__git_ps1)' adds git-related stuff
## '\W' adds the name of the current directory
#export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"


BRANCH_NAME=`echo $(__git_ps1)`
GIT_PROMPT=`echo $(__git_ps1)`

#echo ${BRANCH_NAME:1:7}
#if [[ ${BRANCH_NAME:1:7} == "feature" ]]; then
#    #echo "it's a feat branch"
#    GIT_PROMPT=" (${BRANCH_NAME:1:4}|${BRANCH_NAME:9:7}) "
#fi


export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$cyan\u$green\$(__git_ps1)$lgray \W $ $reset"

