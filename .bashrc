alias vim="nvim"
alias mavenrun="echo && echo ------------------------------------ && mvn package | rg time && echo ------------------------------------ && java -cp target/php-to-java-1.0-SNAPSHOT.jar com.phpToJava.Main && echo"
alias mavenrunfull="mvn package && java -cp target/php-to-java-1.0-SNAPSHOT.jar com.phpToJava.Main"
alias maventest="\$HOME/bashscripts/maventest.sh"
alias catalina=$CATALINA_HOME"/bin/catalina.sh"
alias venv="source ~/bashscripts/venv.sh"
alias fontls='fc-list | awk -F: "{print \$2}" | sort | uniq'
alias vim-dev="~/.config/tmux/tmux-dev.sh"

# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$PATH:/usr/lib/jvm/java-17-openjdk
export PATH="$PATH:$HOME/.config/composer/vendor/bin/"
. "$HOME/.cargo/env"
export PATH=$PATH:/home/saeru/go/bin
