# application alias
alias osub="open -a Sublime\ Text"
alias osub2="open -a Sublime\ Text\ 2"
alias cot="open -a CotEditor"
alias chrome="open -a /Applications/Google\ Chrome.app"
alias st="open -a SourceTree"

alias ex="bundle exec"
alias ssh-list="cat ~/.ssh/config ~/.ssh/conf.d/**/*.conf | less"
# rails alias
alias rails_start="ex rails s -d"
alias rails_stop="cat ./tmp/pids/server.pid | xargs kill"
alias my_branch="git rev-parse --abbrev-ref @"
# notice ex)rails_start; notice
alias notice='terminal-notifier -message "finisshed the command"'
# gnu commands
# alias tar='gtar'
# alias grep='ggrep'
# alias mv='gmv'
# alias cp='gcp'
# alias sed='gsed'

alias ssh="color_change_ssh"
alias clear_term_bgcolor="set_term_bgcolor 0 0 0"

#if which rmtrash > /dev/null 2>&1; then
#  alias rm=rmtrash
#fi
