alias dir="ls -lF"
alias trt="touch tmp/restart.txt"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias mate="subl"
alias getip="ipconfig getifaddr en0 | pbcopy"
alias killaudio="ps aux | grep 'coreaudio[d]' | awk '{print $2}' | xargs sudo kill"
alias irba="bundle exec irb -r ./app"
alias change_mac_address="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig en1 ether"
alias su="su -l"

. ~/.git-completion.sh
# PS1='\u@\h \W$(__git_ps1 " (%s)")\$ '
# PS1='\h \W$(__git_ps1 " (%s)")\$ '
# PS1='\W$(__git_ps1 " (%s)")\$ '
PS1='\[\e]1;${XTERM_TITLE:-\W$(__git_ps1 " (%s)")}\a\]\W$(__git_ps1 " (%s)")\$ '	# sets tab title via MAGIC CODES http://thelucid.com/2012/01/04/naming-your-terminal-tabs-in-osx-lion/

PATH=$PATH:/usr/local/sbin:/usr/local/share/npm/bin

export NODE_PATH="/usr/local/lib/node"

export EDITOR=subl

# http://stackoverflow.com/a/7105609
function serve {
	port="${1:-3000}"
	ruby -r webrick -e "s = WEBrick::HTTPServer.new(:Port => $port, :DocumentRoot => Dir.pwd); trap('INT') { s.shutdown }; s.start"
}

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
