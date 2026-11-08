# Andenes — optional extras for bash / Git Bash

# UTF-8 (prevents repeated characters in Git Bash)
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Add this to your ~/.bashrc AFTER the oh-my-posh init line
# Detects folders where most files (including subfolders) are .sql
function set_poshcontext() {
  if [[ "$PWD" != "$_SQL_LAST_DIR" ]]; then
    _SQL_LAST_DIR="$PWD"
    POSH_SQL=$(git ls-files -co --exclude-standard 2>/dev/null | awk '{t++} /\.sql$/{s++} END{if(t>0 && s/t>0.5) print "1"}')
    export POSH_SQL
  fi
}