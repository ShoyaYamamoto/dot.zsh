# users generic .zshrc file for zsh(1)
SCRIPT_DIR="${HOME}/dot.zsh"

#PROMPT=$'\U1F604 '
# ------------------------------
# Environment variable configuration
# ------------------------------
. ${SCRIPT_DIR}/environment.sh

# ------------------------------
# Default shell configuration
# ------------------------------
. ${SCRIPT_DIR}/default.sh

# ------------------------------
# Load configuration
# ------------------------------
for conf_path in `find $SCRIPT_DIR/conf.d -name "*.sh"`; do
  . $conf_path
done

# ------------------------------
# Load configuration for platform
# ------------------------------
PLATFORM_SCRIPT_DIR=${SCRIPT_DIR}/platforms/`uname`
if [ -d $PLATFORM_SCRIPT_DIR ];then
  for conf_path in `find $PLATFORM_SCRIPT_DIR/conf.d -name "*.sh"`; do
    . $conf_path
  done
fi

# ------------------------------
# Load Command
# ------------------------------
for conf_path in `find $SCRIPT_DIR/extra -name "*.sh"`; do
  . $conf_path
done

# ------------------------------
# Load Submodules
# ------------------------------
. ${SCRIPT_DIR}/submodules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#. ${SCRIPT_DIR}/submodules/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=(${SCRIPT_DIR}/submodules/submodules/zsh-completions/src $fpath)

# ------------------------------
# original settings
# ------------------------------
fpath=(/usr/local/share/zsh-completions $fpath)

function command_not_found_handler(){
  if [ -e /usr/local/bin/jp2a ];then
    if [ -e ~/Desktop/.asobi/but.jpg ];then
      jp2a ~/Desktop/.asobi/but.jpg --width=70
    fi
  fi
  echo "ふぉっふぉっふぉ...$1とはなんでしょうか?\nコマンドが間違っていますよ?"
}

. ${SCRIPT_DIR}/extend.sh
