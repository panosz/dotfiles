fortune
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Ruby exports
  # add user gems to your PATH
  export GEM_HOME=$HOME/.gems
  export PATH="$HOME/.gems/bin:$PATH"


# If you come from bash you might have to change your $PATH.
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
   export PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

export EDITOR=nvim.appimage

# Lines configured by zsh-newuser-install
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# conda {{{
source ~/miniconda3/etc/profile.d/conda.sh
if [[ -z ${CONDA_PREFIX+x} ]]; then
    export PATH="~/conda/bin:$PATH"
fi
# }}}

source "$HOME/.oh-my-zsh/oh-my-zsh.sh"
# Antigen {{{
  source $HOME/.lib/antigen/antigen.zsh
  # Load the oh-my-zsh's library.
  # antigen use oh-my-zsh

  # Bundles from the default repo (robbyrussell's oh-my-zsh).
  antigen bundle git
  antigen bundle pip
  antigen bundle command-not-found
  antigen bundle common-aliases
  antigen bundle vi-mode
  antigen bundle dirhistory


  # Syntax highlighting bundle.
  antigen bundle zsh-users/zsh-syntax-highlighting

  # ZSH-z - a native ZSH port of rupa/z,
  antigen bundle agkozak/zsh-z

  # taskwarrior. Add it here, because adding it before zsh-z breaks zsh-z's tab autocompletion
  antigen bundle taskwarrior

  # suggest existing aliases.
  antigen bundle MichaelAquilina/zsh-you-should-use

  # theme
  antigen theme romkatv/powerlevel10k

  # Tell Antigen that you're done.
  antigen apply
# }}}

# The following lines were added by compinstall
zstyle :compinstall filename '/home/panosz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
zstyle ':completion:*' menu select

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# zoxide{{{
eval "$(zoxide init zsh)"
# }}}
# fzf{{{
[ -f ~/.config/zsh/fzf_config.zsh ] && source ~/.config/zsh/fzf_config.zsh
#}}}
# custom aliases {{{

alias toka="cd ~/Documents/programming/python/Dynamics/tokamaks"
alias vact="source venv/bin/activate"
alias certh_connect="openvpn3 session-start --config /home/panosz/Documents/eketa/vpn/zestanakis/EKETA-T70.ovpn"
alias certh_disconnect="openvpn3 session-manage --config /home/panosz/Documents/eketa/vpn/zestanakis/EKETA-T70.ovpn --disconnect"
alias open="xdg-open"
alias matlab="~/local/MATLAB/R2018a/bin/matlab"
alias wifi_reset="wifi toggle;wifi toggle"
alias mkvenv="python3 -m venv venv"
alias nvim="~/.local/bin/nvim.appimage"
alias gnvim="nvim-qt --nvim ~/.local/bin/nvim.appimage"
alias cgr="covid_cases greece"
alias battery="system76-power profile battery"
alias balanced="system76-power profile balanced"
alias performance="system76-power profile performance"

alias zshrc='${=EDITOR} ${HOME}/.config/zsh/.zshrc'

# disk usage analyzer
alias d="ncdu --exclude /mnt --color dark"


## conda 
alias ca="conda activate"

## connections
alias gateafs="ssh -X gateafs"

# copy and paste{{{
alias -g c="| xclip" # copy to X clipboard
alias v="xclip -o" # paste from X clipboard
alias -g cs="| xclip -selection clipboard" # copy to clipboard so that it can be pasted to non `X` application
alias vs="xclip -o -selection clipboard" # paste from clipboard (from non `X` application)

# }}}
# }}}
# custom functions{{{

covid_cases (){
  local dir
  dir=/home/panosz/Documents/medical/covid
  $dir/venv/bin/python $dir/data_analysis.py "$1"
}

baby (){
  local dir
  dir=/home/panosz/Documents/medical/baby_growth
  $dir/venv/bin/python $dir/plot_data.py
}

fn (){
$EDITOR $(rg -n '>*' "$HOME/vimwiki/"| fzf --layout=reverse --height 50% --ansi| sed -E 's/(.*):([0-9]+):.*/\1 +\2/g');
}

#myip - finds your current IP if your connected to the internet
myip() {
	lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk '{ print $4 }' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g'
}

# }}}
# history{{{
HISTFILE=~/.zsh_history
HISTSIZE=5000  # lines of history within the shell
SAVEHIST=15000 # lines of history in $HISTFILE
HISTORY_IGNORE = '[ \t]*' # prevent commands starting with whitespace from being added to your histfile

# This hook makes it possible to ignore the commands specified in
# HISTORY_IGNORE from all history, so that they cannot be recalled by the up
# and down buttons. See https://unix.stackexchange.com/a/593637/351934

zshaddhistory() {
  emulate -L zsh
  ## uncomment if HISTORY_IGNORE
  ## should use EXTENDED_GLOB syntax
  # setopt extendedglob
  [[ $1 != ${~HISTORY_IGNORE} ]]
}

# }}}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
