# Assumption that we have the variable myip set in .bashrc file from the ansible playbook
# some icons
icon_arch='󰣇'
icon_ubuntu=''
icon_centos=''
icon_ec2user='󱎂'
icon_debian=''
icon_folder=''
icon_start=''
icon_git=''
icon_branch=''

get_git_branch(){
        if [ -d .git ]; then
                git branch 2>/dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[$icon_git $icon_branch \1]/"
        fi
}

if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$NAME
elif type lsb_release >/dev/null 2>&1; then
        OS=$(lsb_release -si)
elif [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        OS=$DISTRIB_ID
elif [ -f /etc/debian_version ]; then
        OS=Debian
else
        OS=$(uname -s)
fi


export PS1="\[\e[38;5;33m\]$icon_arch\[\e[0m\] \[\e[92m\]$myip\[\e[38;5;206;3m\] $icon_folder \w\[\e[0;38;5;51m\] \[\e[0m\]\$icon_start "

