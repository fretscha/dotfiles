# Load the shell dotfiles, and then some:
# * ${HOME}/.path can be used to extend `$PATH`.
# * ${HOME}/.extra can be used for other settings you don’t want to commit.
#for file in ${HOME}/.{path,bash_prompt,exports,aliases,functions,extra}; do
for file in ${HOME}/.{exports,path,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ${HOME}/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ${HOME}/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
#[ -f "/etc/bash_completion" ] && source "/etc/bash_completion"

#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#    . $(brew --prefix)/etc/bash_completion
#fi

if [ -f /usr/local/share/bash-completion/bash_completion ]; then
    . /usr/local/share/bash-completion/bash_completion
fi


# add Django manage competion.
[ -f "${HOME}/.django_completion" ]  && source  "${HOME}/.django_completion"

# include local exports
[ -f "${HOME}/.local_exports" ] && source "${HOME}/.local_exports"

# finally setup virtualenvwrapper
#[ -f "/usr/local/bin/virtualenvwrapper.sh" ] && source "/usr/local/bin/virtualenvwrapper.sh"

# If possible, add tab completion for git
[ -f "${HOME}/.git-completion.bash" ] && source "${HOME}/.git-completion.bash"

# The next line updates PATH for the Google Cloud SDK.
[ -f "${HOME}/projects/google-cloud-sdk/path.bash.inc" ] && source "${HOME}/projects/google-cloud-sdk/path.bash.inc"

# The next line enables bash completion for gcloud.
[ -f "${HOME}/projects/google-cloud-sdk/completion.bash.inc" ] && source "${HOME}/projects/google-cloud-sdk/completion.bash.inc"

# powerline start up
_powerline="/usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh"
[ -f ${_powerline} ] && source ${_powerline}


if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval $(/usr/libexec/path_helper -s)
eval "$(pyenv init -)"
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi

export PATH="$HOME/.poetry/bin:$PATH"
