[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fdfind --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fdfind --type d --hidden --follow --exclude ".git" . "$1"
}

source ~/.config/zsh/my_commands.zsh
# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift


  if cmd_exists batcat; then
    local cat_cmd="batcat --style=numbers --color=always --style=numbers --line-range=:500 {}"
  elif cmd_exists bat; then
    local cat_cmd="bat --style=numbers --color=always --style=numbers --line-range=:500 {}"
  else
    local cat_cmd="cat {}"
  fi

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview $cat_cmd "$@" ;;
  esac
}
