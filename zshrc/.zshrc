# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jesse/.zshrc'

bindkey "^[[3~" delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

zstyle ':completion:*' menu select

autoload -Uz compinit
compinit


alias ls="ls --color=auto"
# End of lines added by compinstall
#
