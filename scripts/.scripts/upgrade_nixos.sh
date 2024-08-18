#!/bin/bash

# Lê a senha do arquivo
SUDO_PASSWORD=$(cat ~/personal/psw.txt)

LOGFILE=~/.scripts/upgrade_log.txt

# Obtém a data e hora atual
CURRENT_DATETIME=$(date "+%Y-%m-%d %H:%M:%S")

# Obtém a geração atual
CURRENT_GENERATION=$(nix-env --list-generations | tail -n 1 | awk '{print $1}')

# Escreve a data, hora e geração atual no topo do arquivo de log
{
    echo -e "Data e Hora: $CURRENT_DATETIME\nGeração Atual: $CURRENT_GENERATION\n"
    cat "$LOGFILE" 2>/dev/null
} > temp && mv temp "$LOGFILE"

# Executa o comando de atualização e salva a saída no arquivo de log
echo "$SUDO_PASSWORD" | sudo -S nixos-rebuild switch --upgrade &>> "$LOGFILE" && less "$LOGFILE"
