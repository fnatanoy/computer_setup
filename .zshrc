DEFAULT_USER=`whoami`
ZSH_THEME="agnoster"

export ZSH=/home/$DEFAULT_USER/.oh-my-zsh

plugins=(git python zsh-256color docker docker-compose)

source $ZSH/oh-my-zsh.sh

# Aliases
source $HOME/.aliases
if [ -f $HOME/.aliases_work ]; then
    source $HOME/.aliases_work
fi

# User configuration
export LANG=en_US.UTF-8
export EDITOR='code'

# Golang configuration
export GO15VENDOREXPERIMENT=1
export GOPATH=/home/nravid/dev
export PATH=$PATH:$GOPATH/bin

# -------------------------- Programs --------------------------
#   Install fzf
if [ ! -f ~/.fzf/install ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#   Install bat
if ! command -v bat > /dev/null; then
    wget -P ~/tmp https://github.com/sharkdp/bat/releases/download/v0.9.0/bat_0.9.0_amd64.deb
    sudo dpkg -i ~/tmp/bat_0.9.0_amd64.deb
fi

#   Install ripgrep
if ! command -v rg > /dev/null; then
    wget -P ~/tmp https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
    sudo dpkg -i ~/tmp/ripgrep_0.10.0_amd64.deb
fi

#   Install fd
if ! command -v fd > /dev/null; then
    wget -P ~/tmp https://github.com/sharkdp/fd/releases/download/v7.2.0/fd_7.2.0_amd64.deb
    sudo dpkg -i ~/tmp/fd_7.2.0_amd64.deb
fi

#   Install zplug
if [ ! -d ~/.zplug ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# Install tpm
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# -------------------------- Zplug --------------------------
source ~/.zplug/init.zsh

# let zplug manage itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Plugins
zplug "b4b4r07/enhancd", use:init.sh
zplug "hcgraf/zsh-sudo"
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "zlsun/solarized-man"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias cc='code .'
alias venv='source venv/bin/activate'


# KENSHOO STUFF
# JAVA stuff for KPO
export CLASSPATH=/home/yonatanf/repos/research-kpo-tools/java-kpo-rerun/classes/artifacts/java_kpo_rerun_main_jar/java-kpo-rerun_main.jar
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_161
export JDK_HOME=/usr/lib/jvm/jdk1.8.0_161
export PATH=$PATH:$JAVA_HOME/bin
export LD_LIBRARY_PATH=/usr/local/MATLAB/MATLAB_Runtime/v90/runtime/glnxa64

alias matlab='cd /usr/local/MATLAB/R2015b/bin && matlab'

source ~/Documents/scripts/kenshoo_dates_converter.sh
alias tmux_kenshoo='source ~/.tmux_kenshoo.sh'

# Stairway To Heaven
source ~/Documents/scripts/jira_jumper.sh
chmod +x ~/Documents/scripts/jira_jumper.sh
export PATH=$PATH:~/Documents/scripts
export PATH=/opt:$PATH
export JIRA_TOOLS_DIR=~/repos/research-monitoring-tools/research-pytools/case_analysis/jira_utils
export JIRA_TOOLS_DIR=~/repos/research-monitoring-tools/research-pytools/case_analysis/jira_utils
export JIRA_TOOLS_DIR=~/repos/research-monitoring-tools/research-pytools/case_analysis/jira_utils