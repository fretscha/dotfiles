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

# Only load Liquidprompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/projects/liquidprompt/liquidprompt && source ~/projects/liquidprompt/themes/powerline/powerline.theme && lp_theme powerline_full



export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


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

if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
