#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

function powerline_precmd() {
    eval "$($HOME/go/bin/powerline-go \
        -shell zsh \
        -error $? \
        -numeric-exit-codes \
        -eval \
        -modules venv,user,ssh,cwd \
        -modules-right git,exit,jobs,time \
        -cwd-max-depth 4 \
        )"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi


# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Applications/google-cloud-sdk/path.zsh.inc' ]; then source '/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Applications/google-cloud-sdk/completion.zsh.inc' ]; then source '/Applications/google-cloud-sdk/completion.zsh.inc'; fi

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# if [ /Applications/google-cloud-sdk/bin/kubectl ]; then source <(kubectl completion zsh); fi


for file in ${HOME}/.{exports,path,aliases,docker_alias,functions,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
