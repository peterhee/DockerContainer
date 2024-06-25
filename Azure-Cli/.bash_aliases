alias lh="ls -lh $1"
alias ltr="ls -ltr $1"
alias li="ls -li $1"
# alias ln="ls -ln $1"
# alias ld="ls -la $1 | grep ^d"
alias cls='clear'
alias h.='history'
alias hf='history | grep $1'
alias pf='ps -e | grep $1'
alias md='mkdir $1'
alias rd='rmdir $1'
alias update='apt update -y && apt upgrade -y'
alias stat='stat -c "%a %n" $1'
alias pgrep='pgrep -a $1'
alias cp='cp -r -v $1 $2'