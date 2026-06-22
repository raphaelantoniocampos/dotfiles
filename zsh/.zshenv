# XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}


# Other paths
export CARGO_HOME="$XDG_DATA_HOME"/cargo 
export GEMINI_CLI_HOME="$XDG_CONFIG_HOME"/gemini
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc":"$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine"
export LEDGER_FILE="$XDG_DATA_HOME"/hledger.journal
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup 
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export CLAUDE_CONFIG_DIR="$XDG_CONFIG_HOME"/claude

mkdir -p "$XDG_DATA_HOME"/wineprefixes > /dev/null 2>&1
mkdir -p "$XDG_CONFIG_HOME/pg" > /dev/null 2>&1
