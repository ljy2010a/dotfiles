export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
if brew list | grep coreutils > /dev/null ; then
  PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  alias ls='ls -F --show-control-chars --color=auto'
  eval `gdircolors -b $HOME/.dir_colors`
fi
alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'

export ANDROID_HOME="~/android-sdk19"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

export GOPATH="~/go"
