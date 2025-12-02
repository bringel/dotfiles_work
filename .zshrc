autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

if [ "$(whoami)" != "codespace" ]; then
  export PANORAMA_TOP=$HOME/development/panorama
else
  export PANORAMA_TOP=/workspaces
  export BROWSER=/bin/true
fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=vim

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
#  package       # Package version
#  gradle        # Gradle section
#  maven         # Maven section
#  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
#  docker        # Docker section
  aws           # Amazon Web Services section
#  gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  conda         # conda virtualenv section
#  pyenv         # Pyenv section
  dotnet        # .NET section
#  ember         # Ember.js section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  ibmcloud      # IBM Cloud section
#  exec_time     # Execution time
  line_sep      # Line break
#  battery       # Battery level and status
#  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_PROMPT_DEFAULT_PREFIX="- "

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
source $PANORAMA_TOP/school-supplies/bin/shell_includes.sh
source $PANORAMA_TOP/school-supplies/bin/aws_sso_shell_includes.sh

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PANORAMA_TOP/school-supplies/bin:$PANORAMA_TOP/nds/bin:$PANORAMA_TOP/monorama/apps/nds/bin"
#eval $(dinghy env)

alias dcr='docker-compose run --rm web'
alias dcrc='docker-compose run --rm web rails c'
alias dcpsql='docker-compose run --rm web bash -c '\''PGPASSWORD=panorama psql --host=db --dbname=nds_dev --username=panorama --expanded auto'\'
alias dctest='docker-compose run --rm test rspec -fd'
alias dctestshell='docker-compose run --rm test bash'
alias weblogs="docker logs --tail 50 --follow nds-web-1"
#alias staging-db="psql $(heroku config:get DATABASE_URL -a panorama-nds-staging)"
#alias playground-db="psql $(heroku config:get DATABASE_URL -a panorama-nds-playground)"
alias local-db="psql postgres://panorama:panorama@localhost/nds_dev"
alias start-pgadmin="docker run -p 5050:80 -e 'PGADMIN_DEFAULT_EMAIL=admin@panoramaed.com' -e 'PGADMIN_DEFAULT_PASSWORD=VerySecret' -e 'PGADMIN_CONFIG_SERVER_MODE=False' -d --name pgadmin dpage/pgadmin4"
alias bundle-oc="bundle install --gemfile=.overcommit_gems.rb"
alias lsp-bundle-update="{ pushd ~/ruby-lsp-custom-bundle; bundle update ruby-lsp; bundle install --without container_only; popd }"
alias mux="tmuxinator"
alias start-sis-credentials-session="pan-leapp-start-session-for 'SIS Credentials' 'CredentialsManagerDevelopment'"
alias dc-guard="docker compose run --rm test bundle exec guard"
alias cs-ssh="gh cs ssh -- -t 'tmux new-session -c /workspaces/monorama/apps/nds -A -s CS'"

function staging-db() {
  psql $(heroku config:get DATABASE_URL -a panorama-nds-staging)
}

function playground-db() {
  psql $(heroku config:get DATABASE_URL -a panorama-nds-playground)
}

function runner-nds() {
 docker-compose run --rm web rails runner "require('irb');IRB.conf[:PROMPT]={};load('.irbrc');$1"
}

function regenerate-school() {
  runner-nds "regenerate_school('$1')"
}

function regenerate-school-inline() {
  runner-nds "regenerate_school('$1',run_inline:true)"
}

function deploy-nds-staging-workers() {
  curl -X POST "https://api.buildkite.com/v2/organizations/panorama-education/pipelines/nds/builds" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer 0d3b1d60e3bd62a58627bed78f63d8aca0f243d3" \
    -d '{
      "commit": "HEAD",
      "branch": "develop",
      "env": {
        "DEPLOY_STAGING_WORKERS": true
      }
    }'
}

function start-exporter-leapp-sessions() {
  pan-leapp-start-session-for 'SIS Credentials' 'CredentialsManagerDevelopment'
  pan-leapp-start-session-for 'SFTP Services' 'EngineeringDefault'
}

function move-session-windows() {
  tmux list-windows -F "#I" -t $1 | xargs -I {} tmux move-window -s "$1:{}"
}

function combine-all-tmux-sessions() {
  CURRENT_SESSION=$(tmux list-sessions -F "#{session_name}" -f "#{session_attached}")

  if [[ -n $CURRENT_SESSION ]]; then
    while read -r line; do
      move-session-windows $line
    done < <(tmux list-sessions -F "#S" -f "#{!=:$CURRENT_SESSION,#S}")
  fi
}

function mux-exporter() {
  pan-leapp-start-session-for 'SIS Credentials' 'CredentialsManagerDevelopment';
  tmux new-window -c $PANORAMA_TOP/monorama/apps/nds -n exporter \; send-keys 'dc build exporter && dc run --rm --service-ports exporter bash' Enter
}

function mux-nds-prod() {
  tmux new-window -c $PANORAMA_TOP/monorama/apps/nds -n 'nds production' \; send-keys 'pan-console nds production' Enter
}

function mux-nds-staging() {
  tmux new-window -c $PANORAMA_TOP/monorama/apps/nds -n 'nds staging' \; send-keys 'pan-console nds staging' Enter
}

function mux-nds-playground() {
  tmux new-window -c $PANORAMA_TOP/monorama/apps/nds -n 'nds playground' \; send-keys 'pan-console nds playground' Enter
}

function update-leapp-sessions() {
  leapp integration sync --integrationId $(leapp integration list --filter="Integration Name=Panorama" --columns=ID --no-header)

  cd $PANORAMA_TOP/leapp-setup && git checkout main && git pull origin main

  ./create-chained-sessions.sh
}

function update-pan-dbs() {
  cd $PANORAMA_TOP/school-supplies && git checkout main && git pull origin main
  $PANORAMA_TOP/school-supplies/bin/database/setup-dbs
}

function start-nds-server() {
  dc up web
}

function start-nds-vite() {
  if [ "$(whoami)" != "codespace" ]; then
    yarn run dev
  else
    dc up vite --watch
  fi
}

function start-nds() {
  tmux new-window -n 'run nds';
  tmux send-keys 'cd $nds' Enter 'start-nds-server' Enter;
  tmux split-window;
  tmux send-keys 'cd $nds' Enter 'start-nds-vite' Enter;
}

function caffeinate-hours() {
  caffeinate -dims -t $(( $1 * 3600 )) &;
}
# docker desktop setup
export PATH="$HOME/.docker/bin:$PATH"
INOTIFY_ENABLED=true

#source ~/dotfiles/color_background_overwrites.sh

chruby ruby-3.3.10

