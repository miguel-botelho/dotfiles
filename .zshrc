# If you come from bash you might have to change your $PATH.
export PATH=$HOME/go/bin:$PATH
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
ZSH_THEME="awesomepanda"
export UPDATE_ZSH_DAYS=5

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
  wd
  zsh-autosuggestions
  zsh-syntax-wighlighting
  heroku
  docker
)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export EDITOR=vim

function grh!()
{
    git reset --hard origin/$(git branch | grep \* | cut -d ' ' -f2)
}

function check_port()
{
   if (lsof -nP -i4TCP:$1 | grep LISTEN); then

   else
     echo "Nothing is listening on port $1"
   fi
}

eval "$(direnv hook zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

alias weather="curl -4 http://wttr.in/porto"
