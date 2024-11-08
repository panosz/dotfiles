fortune

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
[[ ! -f ~/miniconda3/etc/profile.d/conda.sh ]] || source ~/miniconda3/etc/profile.d/conda.sh
if [[ -z ${CONDA_PREFIX+x} ]]; then
    export PATH="~/conda/bin:$PATH"
fi
# }}}

# sectrets {{{
[[ ! -f ~/.secrets.zsh ]] || source ~/.secrets.zsh
# }}}

# options {{{ man zshoptions for more info
setopt auto_cd
setopt multios
setopt prompt_subst
# }}}

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/common-aliases
    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh plugins/dirhistory
    zgen oh-my-zsh plugins/colored-man-pages
    zgen oh-my-zsh plugins/taskwarrior

    # Syntax highlighting
    zgen load zsh-users/zsh-syntax-highlighting

    # completions
    zgen load zsh-users/zsh-completions src

    # save all to init script
    zgen save
fi

## theme
eval "$(starship init zsh)"

# The following lines were added by compinstall
zstyle :compinstall filename '/home/panosz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
zstyle ':completion:*' menu select

# zoxide{{{
eval "$(zoxide init --cmd cd zsh)"
# }}}
# fzf{{{
[ -f ~/.config/zsh/fzf_config.zsh ] && source ~/.config/zsh/fzf_config.zsh
#}}}
# custom aliases {{{
alias bat="batcat"
alias tmux="~/.local/bin/tmux"
alias fd=fdfind # this is the name of `fd` in ubuntu, when installed with apt
alias toka="cd ~/Documents/programming/python/Dynamics/tokamaks"
alias vact="source venv/bin/activate"
alias certh_connect="sudo openvpn3 session-start --config /home/panosz/Documents/eketa/vpn/zestanakis/EKETA-T70.ovpn"
alias certh_disconnect="sudo openvpn3 session-manage --config /home/panosz/Documents/eketa/vpn/zestanakis/EKETA-T70.ovpn --disconnect"
alias open="xdg-open"
alias matlab="~/local/MATLAB/R2018a/bin/matlab"
alias wifi_reset="wifi toggle;wifi toggle"
alias mkvenv="python3.11 -m venv venv"
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
# key bindings{{{
#
bindkey -s '^Z' 'zi\n'
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

# find in notes (recipe from here: https://github.com/junegunn/fzf#turning-into-a-different-process)
fn (){
rg -n '>*' "$HOME/vimwiki_markdown/" | fzf --layout=reverse --height 50% --ansi --delimiter : --nth 3.. --bind 'enter:become(nvim.appimage {1} +{2})'
}

#myip - finds your current IP if your connected to the internet
myip() {
	lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk '{ print $4 }' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g'
}

jpg_to_pdf(){
  local infile="$1"
  local quality="${2:-40}"
  local outfile="${infile%.*}.pdf"
  convert "$infile" -quality "$quality" -page a4 "$outfile"
}

# }}}
# history{{{
HISTFILE=~/.zsh_history
HISTSIZE=5000  # lines of history within the shell
SAVEHIST=15000 # lines of history in $HISTFILE
setopt hist_ignore_space # remove command from history if it starts with a space
# }}}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
