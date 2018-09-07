export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
ZSH_CUSTOM=~/.oh-my-custom
plugins=(git)

if [[ -f $ZSH/oh-my-zsh.sh ]]; then
  source $ZSH/oh-my-zsh.sh
fi

# environment variables
export PATH="${PATH}:${HOME}/bin:/usr/local/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export EDITOR=~/bin/edit
export NNTPSERVER='news.gmane.org'

# aliases
alias traceroute="traceroute -A whois.arin.net"
alias vi="edit"

# ruby
# export RBENV_ROOT=/usr/local/var/rbenv
# if which rbenv 2>/dev/null; then eval "$(rbenv init -)"; fi
# alias rake="noglob rake"

if [[ -f /usr/libexec/path_helper ]]; then
  eval `/usr/libexec/path_helper -s`
fi

# golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin

# python
# export PYENV_ROOT=/usr/local/var/pyenv
# if which pyenv 2>/dev/null; then eval "$(pyenv init -)"; fi

# perl
PERL_MB_OPT="--install_base \"${HOME}/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"; export PERL_MM_OPT;

# Things that shouldn't be shared
if [[ -f ~/.zshrc-private ]]; then
  . ~/.zshrc-private
fi

# Windows
if [ -d /mnt/c/Windows ] || [ $LC_WINDOWS10 ]; then
          export WINDOWS10=0
fi
if [ $WINDOWS10 ]; then
          export LC_WINDOWS10=$WINDOWS10
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

TZ='America/New_York'; export TZ
