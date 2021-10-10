# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

if [[ $EUID -ne 0 ]];then
	cat /home/bq666/.my-config/.usefulCommands.txt
echo "---------------------------------------------------------------------------------------------------------------------------------------"
screenfetch
echo "---------------------------------------------------------------------------------------------------------------------------------------"
fi

if [[ $(hostname) == "NAS" ]]; then
	zpool status NEW_DISKS -v
	zpool status OLD_DISKS -v
fi

eval $(thefuck --alias)
# If you come from bash you might have to change your $PATH.
PATH=$HOME/bin:/usr/local/bin:$PATH
#export PATH=/opt/apache-maven-3.6.2/bin:$PATH

# Icons
source $(dirname $(gem which colorls))/tab_complete.sh

# Colors in termianl
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(ansible autojump git zsh-autosuggestions zsh-syntax-highlighting dotenv thefuck postgres mvn httpie docker docker-compose ufw rsync tmux) 

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gits='git status'
alias gita='git add .'
alias gitc='git commit'
alias gitcn='git commit -m"next"'
alias gitp='git push'
alias gcnp='gita; gitcn; gitp'
alias netstatmy='netstat -nautpl'
alias ls='colorls --group-directories-first'
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long'
alias la='ls -la'
alias watch='watch -n.1'
alias t='todo.sh'

function doer() {
busy=true
while $busy
do
 if mountpoint -q "$1"
 then
  umount "$1" 2> /dev/null
  if [ $? -eq 0 ]
  then
   busy=false  # umount successful
  else
   echo -n '.'  # output to show that the script is alive
   sleep 5      # 5 seconds for testing, modify to 300 seconds later on
  fi
 else
  busy=false  # not mounted
 fi
done
}

function on(){
	piactl disconnect
	sleep 2
	wakeonlan $OLD_MAC
	piactl connect
	mount -t nfs NAS:/mnt/NEW_DISKS/Plex /mnt/NAS_Plex
	# mount -t nfs NAS:/mnt/NEW_DISKS/Storage /mnt/NAS_Storage
	apt update; apt -y upgrade
}

function off(){
	pkill qbittorrent
	doer /mnt/NAS_Plex
	sleep 2
	systemctl suspend
}




#----------------------------------------------------------------------------------------------------------------------------------------------------------
#POWERLEVEL9K_COLOR_SCHEME='dark'
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="❯ "

#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=('os_icon' 'host' 'user' 'vcs' 'dir' 'dir_writable' 'status')

#POWERLEVEL9K_OS_ICON_FOREGROUND="black"
#POWERLEVEL9K_OS_ICON_BACKGROUND=022

#POWERLEVEL9K_HOST_LOCAL_FOREGROUND=022
#POWERLEVEL9K_HOST_LOCAL_BACKGROUND="black"
#POWERLEVEL9K_HOST_REMOTE_FOREGROUND="red"
#POWERLEVEL9K_HOST_REMOTE_BACKGROUND="black"
#POWERLEVEL9K_HOST_ICON="\uF109 "
#POWERLEVEL9K_SSH_ICON="\uF489 "

#POWERLEVEL9K_USER_DEFAULT_FOREGROUND="black"
#POWERLEVEL9K_USER_DEFAULT_BACKGROUND=022
#POWERLEVEL9K_USER_SUDO_FOREGROUND="red"
#POWERLEVEL9K_USER_SUDO_BACKGROUND=022
#POWERLEVEL9K_USER_ROOT_FOREGROUND="black"
#POWERLEVEL9K_USER_ROOT_BACKGROUND="red"
#POWERLEVEL9K_USER_ICON="\uF415" # 
#POWERLEVEL9K_ROOT_ICON="#"
#POWERLEVEL9K_SUDO_ICON=$'\uF09C' # 

#POWERLEVEL9K_VCS_CLEAN_FOREGROUND="black"
#POWERLEVEL9K_VCS_CLEAN_BACKGROUND=034
#POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="red"
#POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=034
#POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="black"
#POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="red"
#POWERLEVEL9K_VCS_STAGED_ICON="\u00b1"
#POWERLEVEL9K_VCS_UNTRACKED_ICON="\u25CF"
#POWERLEVEL9K_VCS_UNSTAGED_ICON="\u00b1"
#POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON="\u2193"
#POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON="\u2191"
#POWERLEVEL9K_SHOW_CHANGESET="true"
#POWERLEVEL9K_CHANGESET_HASH_LENGTH="12"





#POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
#POWERLEVEL9K_DIR_HOME_BACKGROUND=024
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="black"
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=023
#POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"
#POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=025
#POWERLEVEL9K_DIR_ETC_FOREGROUND="black"
#POWERLEVEL9K_DIR_ETC_BACKGROUND="red"
#POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND="red"
#POWERLEVEL9K_DIR_NOT_WRITABLE_BACKGROUND=025
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=5





#POWERLEVEL9K_STATUS_VERBOSE="true"
#POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
#POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
#POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
#POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"

# POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="echo wifi: \$(nmcli device wifi | grep yes | awk '{print \$8}')"
# POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=('background_jobs' 'history' 'battery' 'ip' 'public_ip' 'vpn_ip')

# POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=166
# POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=022

# POWERLEVEL9K_HISTORY_FOREGROUND=022
# POWERLEVEL9K_HISTORY_BACKGROUND="black"

# POWERLEVEL9K_BATTERY_LOW_THRESHOLD=20
# POWERLEVEL9K_BATTERY_VERBOSE=true
#POWERLEVEL9K_BATTERY_STAGES=(
##   $'▏    ▏' $'▎    ▏' $'▍    ▏' $'▌    ▏' $'▋    ▏' $'▊    ▏' $'▉    ▏' $'█    ▏'
##   $'█▏   ▏' $'█▎   ▏' $'█▍   ▏' $'█▌   ▏' $'█▋   ▏' $'█▊   ▏' $'█▉   ▏' $'██   ▏'
##   $'██   ▏' $'██▎  ▏' $'██▍  ▏' $'██▌  ▏' $'██▋  ▏' $'██▊  ▏' $'██▉  ▏' $'███  ▏'
##   $'███  ▏' $'███▎ ▏' $'███▍ ▏' $'███▌ ▏' $'███▋ ▏' $'███▊ ▏' $'███▉ ▏' $'████ ▏'
##   $'████ ▏' $'████▎▏' $'████▍▏' $'████▌▏' $'████▋▏' $'████▊▏' $'████▉▏' $'█████▏' )
## POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND=(red orangered darkorange orange gold yellow yellow greenyellow chartreuse1 chartreuse2 green1)
#POWERLEVEL9K_BATTERY_LOW_FOREGROUND="black"
#POWERLEVEL9K_BATTERY_LOW_BACKGROUND="red"
#POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND=125
#POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="green"
#POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="black"
#POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="green"
#POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=196
#POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="green"

#POWERLEVEL9K_IP_FOREGROUND="black"
#POWERLEVEL9K_IP_BACKGROUND=022

#POWERLEVEL9K_PUBLIC_IP_FOREGROUND=022
#POWERLEVEL9K_PUBLIC_IP_BACKGROUND="black"
#POWERLEVEL9K_PUBLIC_IP_FILE="/tmp/p9k_public_ip_user"
#POWERLEVEL9K_IP_INTERFACE="enp7s0"
#POWERLEVEL9K_VPN_IP_INTERFACE="tun0"
#POWERLEVEL9K_PUBLIC_IP_NONE="No internet"

#POWERLEVEL9K_TIME_BACKGROUND="clear"
#POWERLEVEL9K_TIME_FOREGROUND="022"
#POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d.%m.%y}"













# POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="red"
# POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="white"
# POWERLEVEL9K_TODO_BACKGROUND="clear"
# POWERLEVEL9K_TODO_FOREGROUND="green"
# POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="clear"
# POWERLEVEL9K_LOAD_WARNING_BACKGROUND="clear"
# POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="clear"
# POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
# POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
# POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="green"
# POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
# POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
# POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
# POWERLEVEL9K_RAM_BACKGROUND="clear"
# POWERLEVEL9K_RAM_FOREGROUND="green"
# POWERLEVEL9K_RAM_ELEMENTS="ram_use"



# POWERLEVEL9K_CONTEXT_TEMPLATE="%n"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
