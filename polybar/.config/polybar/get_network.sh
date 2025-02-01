#!/bin/bash

# Verifica se há uma conexão ativa (priorizando a conexão cabeada)
eth_connection=$(nmcli -t -f DEVICE,STATE | grep -e "conectado" -e "connected" | grep "ethernet")

# Se não encontrar conexão cabeada, verifica a conexão wireless
if [ -z "$eth_connection" ]; then
    wifi_connection=$(nmcli -t -f DEVICE,STATE | grep -e "conectado" -e "connected" | grep -v "externally" | grep -v "desconectado" | awk -F: '{print $1}')
    
    if [ -n "$wifi_connection" ]; then
        connection="$wifi_connection"
    else
        connection="No Connection"
    fi
else
    connection="$eth_connection"
fi

echo "$connection"

