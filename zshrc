# Export Statements
export ZSH="/Users/loaner/.oh-my-zsh"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home
export GRADLE_HOME=/usr/local/scaligent/toolchain/gradle/gradle-5.2
export GIT_ROOT=~/thoughtspot
export CLUSTER_IP=172.18.22.6
export PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$GRADLE_HOME/bin:$PATH
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!*.{class}" '


#Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

DEFAULT_USER=$(whoami)
#Plugins
plugins+=(git)
plugins+=(zsh-autosuggestions)
plugins+=(zsh-syntax-highlighting)
plugins+=(k)
plugins+=(gradle-completion)

#Custom Commands

  #Directory Commands
  tlc() {
    cd /usr/local/scaligent/toolchain
  }
  ts() {
    cd $GIT_ROOT
  }

  #Build Commands
  ball() {
    ts
    gradle build -x test
  }
  gens() {
    ts
    gradle :thoughtspot-common:generateSources
  }
  cmod() {
    ts
    gradle :$1:build -x test
  }
  bcsum() {
    ts
    bcmod callosum-server
  }
  batlas() {
    ts
    bcmod atlas
  }
  bct() {
    ts
    gradle :$1:build testClasses -x test
  }
  #Push to Cluster Commands
  pcsum() {
    scp $GIT_ROOT/callosum/server/target/callosum-server-1.0-SNAPSHOT.war admin@$CLUSTER_IP:/usr/local/scaligent/release/callosum/server/target
  }
  pcacli() {
    scp $GIT_ROOT/atlas/utilities/target/atlas-utilities-1.0-SNAPSHOT-jar-with-dependencies.jar
  }
  patlas() {
    SCP $GIT_ROOT/callosum/utilities/target/atlas-utilities-1.0-SNAPSHOT-jar-with-dependencies.jar admin@$CLUSTER_IP:/usr/local/scaligent/release/atlas/utilities/targett
  }

  #SSH Nebula Cluster Commands
  sshneb() {
    ssh admin@$CLUSTER_IP
  }


#Souce Commands
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
