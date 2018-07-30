# expand aliases before completing
setopt complete_aliases # aliased ls needs if file/dir completions work

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias reload="source ~/dot.zsh/.zshrc"
alias a=alias
alias du="du -h"
alias df="df -h"
alias h="history"
alias j="jobs -l"
alias la="ls -aF"
alias lf="ls -F"
alias ll="ls -lF"
alias lla="ls -alF"
alias sc="screen -D -RR"
alias screen="screen -D -RR"
alias su="su -l"
alias va="vagrant"
alias va-running-list="va global-status | grep running | awk '{print $5}'"
alias where="command -v"

alias urlencode="nkf -wMQ | tr = %"
alias urldecode="nkf --url-input"

alias ymd="date +'%Y%m%d'"

# This code is deprecated because openSSH got 'Include' directive.
# Please write the config 'Include ~/.ssh/conf.d/**/*.conf'
# if [ -d ~/.ssh/conf.d ]; then
#   # feature "conf.d"
#   alias ssh_config_update=": > ~/.ssh/config && echo '# DO NOT EDIT! Please edit conf.d/' >> ~/.ssh/config && find ~/.ssh/conf.d -type f | grep -v '/\.git' | xargs cat >> ~/.ssh/config"
#   alias ssh="ssh_config_update; ssh"
# fi

# peco-collection
alias find-p=' print -z $(find . | peco)'
alias find-d=' print -z $(find . -type d | peco)'
alias find-f=' print -z $(find . -type f | peco)'
alias pushd-p='print -z pushd +$(dirs -v | peco | head -n1 | awk '\''{print $1}'\'')'

alias ssh-p=' print -z ssh $(ssh-list | grep "^Host" | sed "s/^Host //g" | peco | awk '\''{print $1}'\'')'
if [ -f ~/dot.zsh/tmp/projects_paths.txt ]; then
  alias cd-p=' print -z cd $(cat ~/dot.zsh/tmp/projects_paths.txt | sed "s;${HOME};~;g" | peco)'
fi

# if [ "${PAGER}" != "less" ]; then
#   alias less=${PAGER}
# fi

# original alias
alias aa-color="jp2a -b --width=150 --color"
alias aa-monokuro="jp2a -b --width=150"
alias DS-delete="find ./ -name '.DS_Store' -exec rm -f {} \;"
alias chown-oro="chown -R oro:oro ./"
alias chmod-777="chmod -R 777 ./"
alias ssh-host="cat ~/.ssh/config | grep 'Host '"
function dict() {
    grep $1 ~/gene95/gene-utf8.txt -A 1 -wi --color
}


# proxy-server-command
alias proxy_check='ps ax | grep ssh'
alias proxy_up_aeon-tools='ssh -f -N -D 1080 aeon-tools.os.jp.oro.com'

# trash-command-settings
alias rm='trash-put'
alias rm-list='trash-list'
alias rm-restore='trash-restore'
alias rm-trash='trash-rm'
alias rm-all-trash='trash-empty'

function git_diff_archive() 
{
  local diff=""
  local h="HEAD"
  if [ $# -eq 1 ]; then
    if expr "$1" : '[0-9]*$' > /dev/null ; then
      diff="HEAD~${1} HEAD"
    else
      diff="${1} HEAD"
    fi
  elif [ $# -eq 2 ]; then
    diff="${2} ${1}"
    h=$1
  fi
  if [ "$diff" != "" ]; then
    diff="git diff --diff-filter=d --name-only ${diff}"
  fi
  git archive --format=zip --prefix=root/ $h `eval $diff` -o archive.zip
}
