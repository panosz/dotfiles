function cmd_exists() {
  if [ ! "$(command -v $1)" ]; then
    return 1
  fi
}


if  cmd_exists "batcat" ; then 
  local preview_command="batcat --style=numbers --color=always --line-range :500"
else preview_command="cat"
fi

function preview(){
  $preview_command $1

}
