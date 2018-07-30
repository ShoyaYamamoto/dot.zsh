export BLOCKSIZE=K
export EDITOR=vi

# ------------------------------
# Ruby
# ------------------------------
if [[ -s /usr/local/bin/rbenv ]] ; then
  # rbenv
  eval "$(rbenv init - zsh)"
elif [[ -s $HOME/.rvm/scripts/rvm ]] ; then
  # rvm
  source $HOME/.rvm/scripts/rvm
fi

# ------------------------------
# python,pyenv
# ------------------------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$PYENV_ROOT/versions/anaconda3-5.2.0/bin/:$PATH"

# ------------------------------
# JVM SBT
# ------------------------------
export SBT_OPTS='-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=1024M'

# ------------------------------
# Android
# ------------------------------
export ANDROID_HOME=/Applications/android-sdk-macosx
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools

# ------------------------------
# Haskell
# ------------------------------
export PATH=$PATH:$HOME/.cabal/bin

# ------------------------------
# User local script
# ------------------------------
export PATH=$PATH:$HOME/bin

# ------------------------------
# nodebrew
# ------------------------------
export PATH=$HOME/.nodebrew/current/bin:$PATH

# ------------------------------
# yarn
# ------------------------------
export PATH=$HOME/.yarn/bin:$PATH

# ------------------------------
# openssl
# ------------------------------
export PATH=/usr/local/Cellar/openssl/1.0.2o_2/bin:$PATH

# ------------------------------
# mysql
# ------------------------------
export PATH=/usr/local/opt/mysql@5.7/bin:$PATH

# ------------------------------
# imagemagick @6
# ------------------------------
export PATH=/usr/local/opt/imagemagick@6/bin:$PATH

# ------------------------------
# composer #php7cc
# ------------------------------
export PATH=$PATH:~/.composer/vendor/bin

# ------------------------------
# direnv
# ------------------------------
if which direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# ------------------------------
# user custom commands
# ------------------------------
. $SCRIPT_DIR/skinny.sh
. $SCRIPT_DIR/_skinny

function sushi() {
	ruby -e 'C=`stty size`.scan(/\d+/)[1].to_i;S="\xf0\x9f\x8d\xa3";a={};puts "\033[2J";loop{a[rand(C)]=0;a.each{|x,o|;a[x]+=1;print "\033[#{o};#{x}H \033[#{a[x]};#{x}H#{S} \033[0;0H"};$stdout.flush;sleep 0.01}'
}

