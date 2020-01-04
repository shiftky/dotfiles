function peco-history-selection() {
  if [ `uname` = 'Darwin' ]; then
    REVERSE_CMD="tail -r"
  else
    REVERSE_CMD="tac"
  fi
  BUFFER=`history -n 1 | $REVERSE_CMD | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
