#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
PS1='\W [\t]> '
export WINEPREFIX='/home/jesse/.new32prefix/'
alias reddit='rtv'
alias l='ls -al'
alias open='xdg-open'
alias tmux='tmux -u'
#setfont /usr/share/kbd/consolefonts/lat4-19.psfu.gz
export PATH=/home/jesse/.gem/ruby/2.5.0/bin:/usr/lib/ruby/gems/2.5.0/bin:$PATH
export PYTHONIOENCODING=utf8
#PATH=$PATH:~/.local/bin
export PYTHONPATH="${PYTHONPATH}:./"
