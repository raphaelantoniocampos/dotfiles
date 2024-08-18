#!/bin/bash

# Verifica se há uma conexão wireless ativa
wireless=$(nmcli -t -f ACTIVE,DEVICE,SSID dev wifi | awk -F ':' '$1 == "sim" {print $2 ": " $3}')

# Verifica se há uma conexão ethernet ativa
ethernet=$(nmcli -t -f ACTIVE,DEVICE,STATE | grep "conectado" | grep "cabeada" | awk -F':' '{print $1 ": " connected}')

# Mostra a conexão ativa
if [ -n "$ethernet" ]; then
    echo $ethernet
elif [ -n "$wireless" ]; then
    echo $wireless
else
    echo "No Connection"
fi

