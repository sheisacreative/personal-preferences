RED_LIGHT=$'%F{217}'
RED_DARK=$'%F{203}'
BLUE_LIGHT=$'%F{117}'
NEW_LINE=$'\n'

precmd() {
  emulate -L zsh -o extended_glob
  local branch
  if (( $+commands[git] )) &&
     [[ -n $GIT_DIR || -n ./(../)#.git(#qN) ]] &&
     branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null); then
    typeset -g psvar=($branch)
  else
    typeset -g psvar=()
  fi
}

setopt prompt_percent no_prompt_subst
PS1="${RED_LIGHT}%T%f ${RED_LIGHT}•%f ${RED_LIGHT}%m%f %B${RED_DARK}%c%f%b ${BLUE_LIGHT}[%v]%f 🐮${NEW_LINE}"