alias vim="nvim"
# alias mavenrun="echo && echo ------------------------------------ && mvn package | rg 'time|ERROR' && echo ------------------------------------ && java -cp target/php-to-java-1.0-SNAPSHOT.jar com.phpToJava.Main && echo"
# alias mavenrun="echo && echo ------------------------------------ && java -cp $(mvn dependency:build-classpath -q -DincludeScope=runtime -Dmdep.outputFile=/dev/stdout):target/php-to-java-1.0-SNAPSHOT.jar com.phpToJava.Main && echo"
alias mavenbuild="\$HOME/bashscripts/mavenbuild.sh"
alias mavenrun="\$HOME/bashscripts/mavenrun.sh"
alias maventest="\$HOME/bashscripts/maventest.sh"

alias catalina=$CATALINA_HOME"/bin/catalina.sh"
alias venv="source ~/bashscripts/venv.sh"
alias fontls='fc-list | awk -F: "{print \$2}" | sort | uniq'
alias vim-dev="~/.config/tmux/tmux-dev.sh"
alias serve-static="source ~/bashscripts/serve-static.sh"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$PATH:/usr/lib/jvm/java-17-openjdk
export PATH="$PATH:$HOME/.config/composer/vendor/bin/"
# "$HOME/.cargo/env"
export PATH=$PATH:/home/saeru/go/bin
export NVM_DIR="$HOME/.nvm"
export PATH="$PATH:/home/saeru/.local/share/gem/ruby/3.3.0/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export KUBE_EDITOR=nvim
