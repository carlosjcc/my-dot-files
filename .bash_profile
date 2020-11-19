# colors
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"
cyan="\[\033[0;36m\]"
#BCyan="\[\033[2;36m\]"
BCyan="\[\e[38;5;23m\]" 
red="\[\033[0;31m\]"
blue="\[\033[0;34m\]"
green="\[\033[0;32m\]" 
gray="\[\e[38;5;8m\]"


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# THIS DOES NOT WORK
# make less more friendly for non-text input files, see lesspipe(1)
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# the one and only true text editor
export EDITOR=vim

# make less more readable for large data sets
export LESS="-XRFS"

# enable color support of ls and also add handy aliases
if [ -x /usr/local/bin/gdircolors ]; then
	test -r ~/.gdircolors && eval "$(gdircolors -b ~/.gdircolors)" || eval "$(gdircolors -b)"

	# https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/ 
	export CLICOLOR=1
	export LSCOLORS=GxFxCxDxBxegedabagaced
	alias ls='ls -G'
	# alias dir='dir --color=auto' #alias vdir='vdir --color=auto'
	
	alias grep='grep --color=auto --exclude=\*.{pyc}'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
	alias grepy='printf "\033[0;31m excluding logs\n\033[0m" && grep -EIrn --exclude-dir 'logs' --exclude=tags --exclude="*\.css" --exclude="*\.js" --exclude="*\.xml" --color=always'

	alias gb='git branch'
	alias gs='git status'
	alias gd='git diff'

	alias less='less -RN'
	alias pwdc='pwd | tr -d '\n' | pbcopy'

	# git
	alias glg='git log --oneline --decorate --graph --all'

	alias td='vim ~/Dropbox/terminal/tmux/tmux.txt'
	alias vd='vim ~/Dropbox/terminal/vim/vim.txt'
	alias vrc='vim ~/.vimrc'
	alias bap='vim ~/.bash_profile'

	# middleware aliases

	alias redis='redis-cli'
	alias redispp='redis-cli -h 10.60.81.161 -p 6380'
	alias j='jobs -l'
	alias km="jobs -p | xargs kill"
	# alias km='jpkill -f \"python server\"'
	alias bp='vim ~/.pdbrc'
	alias mwd='PYTHONPATH="../lib" python server.py'
	alias mw='PYTHONPATH="../lib" python server.py  --debug --capture_request_context >> >(tee -a ~/projects/mw2/logs/stdout.log) 2>> >(tee -a ~/projects/mw2/logs/stderr.log >&2)'
	alias pro='python manage.py runserver 0.0.0.0:8000'
	alias redis-pre='redis-cli -h 10.80.72.20 -p 6380'
	alias contp='python manage.py continuous_provisioning editorial_item_lists editorial_mapping_lists households isps plans releases vod_price_rules vod_titles titles ratings settings packages entitlements images:3 applications image_presets:3 object_store_images:3 object_store_image_presets:3 channels actionable_virtual_channels content_classes request_image_provisioning provision_image_maps_to_redis item_list_provisioning_request prepared_items curated_content_lists'
	alias proterm='cd ~/projects/provisioning/provisioning && pyenv activate prov && source ~/.bash_profile && clear'
	alias mwterm='cd ~/projects/mw2/middle/ && pyenv activate mw && source ~/.bash_profile && clear'
	alias sterm='cd ~/projects/search_server && pyenv activate search && source ~/.bash_profile && clear'
	alias pptunnel='ssh -L 9000:preprod.rds.fetchtv.com.au:3306 sv425-mwpp1.eq.i.fetchtv.com.au'

	# calls
	alias c='curl -b cookies.txt  --header "X-FTV-Capabilties: stb-GEN3,v.development,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,hlsonly,HEVC,ac3" 127.0.0.1:12121/v4/epg/reverse_catchup | python -m json.tool'
	alias rod='curl -b cookies.txt  --header "X-FTV-Capabilties: stb-GEN3,v.development,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,hlsonly,HEVC,ac3" 127.0.0.1:12121/v4/epg/channels | python -m json.tool'

	alias pauth='curl -c pcookies.txt -H "User-Agent: Takin/3.0.0 (Linux arm ; U; en), STB/2.8.115 Version/11.10, GFiber_STB_GC4155/2.22 (FETCHTV, M605T, Wired)" --header "X-FTV-Capabilties: stb-Gen3,v.development,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,hlsonly,HEVC,ac3,4K" --data "auth_id=0C:56:5C:6D:9C:4A&auth_token=5pgduuszkx" https://apis.fetchtv.com.au/v2/authenticate | python -m json.tool | less'
	alias ppauth='curl -c ppcookies.txt -H "User-Agent: Takin/3.0.0 (Linux arm ; U; en), STB/2.8.115 Version/11.10, GFiber_STB_GC4155/2.22 (FETCHTV, M605T, Wired)" --header "X-FTV-Capabilties: stb-Gen3,v.development,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,hlsonly,HEVC,ac3,4K" --data "auth_id=0C:56:5C:6D:9C:4A&auth_token=5pgduuszkx" http://10.65.72.121:12121/v2/authenticate | python -m json.tool | less'
	alias lauth='curl -c cookies.txt -H "User-Agent: Takin/3.0.0 (Linux arm ; U; en), STB/2.8.115 Version/11.10, GFiber_STB_GC4155/2.22 (FETCHTV, M605T, Wired)" --header "X-FTV-Capabilties: stb-GEN3,v.development,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,hlsonly,HEVC,ac3,4K" --data "auth_id=0C:56:5C:6D:9C:4A&auth_token=5pgduuszkx" 127.0.0.1:12121/v2/authenticate | python -m json.tool | less'

fi

capabilities="stb-Gen3,3.10,stb,vod_purchase,vod_rent,season_pass,virtual_channel,EST_OLS,special_price,free_pack,plan_subsets,skinny_epg,fta_catchup,off_air_catchup,actionable_virtual_channel,team_tags_v2,apps_flat_list,ui3,hlsonly,HEVC,ac3,staff,karen"
user_agent="Takin/3.0.0 (Linux arm ; U; en), STB/2.8.115 Version/11.10, GFiber_STB_GC4155/2.22 (FETCHTV, M605T, Wired)"

# mw functions
mw_get() {

    if [ $1 = 'l' ]; then
        cookies="cookies.txt"
    elif [ $1 = 'pp']; then
        cookies="ppcookies.txt"
    elif  [ $1 = 'p']; then
        cookies="pcookies.txt"
    else
        echo "choose whether l, pp, p for cookies"
    fi

    curl -b "$cookies" -H "$user_agent" -H "$capabilities" sv922-mwp11.eq.i.fetchtv.com.au:12121/v4/search --data "words=war&scope=All&count=100"

}



# Completion files
# downloaded from https://github.com/imomaliev/tmux-bash-completion
source ~/tmux-completion.bash
source ~/git-completion.bash

# I think this is necessary for color consistency on tmux with vim
export COLORFGBG=
export COLORTERM=

# prompt configuation

source ~/git-prompt.sh

# function to format the prompt if there's feature branches 
short_prompt() {

	BRANCH_NAME=`echo $(__git_ps1)`
	GIT_PROMPT=`echo $(__git_ps1)`

	if [[ ${BRANCH_NAME:1:7} == "feature" ]]; then
		#GIT_PROMPT=" (${BRANCH_NAME:1:4}|${BRANCH_NAME:9:7}"
		GIT_PROMPT=" (${BRANCH_NAME:9:7}"

		    	            
		if [[ ${BRANCH_NAME:(-2):1} == "*" ]]; then
			# if there's unsaved changes in the branch
			GIT_PROMPT+=" *) "         
		else
			GIT_PROMPT+=") "
		fi

		echo -e "$GIT_PROMPT"
	
	elif [[ $BRANCH_NAME == "" ]]; then 
		echo -e " "
	else
		echo -e " $BRANCH_NAME "
	fi
}

export GIT_PS1_SHOWDIRTYSTATE=1

#export PS1="$BCyan\u $cyan\W$reset $ "
export PS1="$BCyan\u$gray\$(short_prompt)$cyan\W $ $reset"

eval "$(pyenv init -)"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
