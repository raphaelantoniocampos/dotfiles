#!/bin/bash

# Obtém a janela ativa ou retorna JSON vazio
ACTIVE_WIN=$(hyprctl activewindow -j || echo '{}')

# Processa com jq garantindo campos obrigatórios
echo "$ACTIVE_WIN" | jq -c '
{
    class: (.class // "unknown"),
    title: (.title // ""),
    address: (.address // ""),
    icon: (if .class == "kitty" then "terminal"
          elif .class == "LibreWolf" then "web-browser"
          elif .class == "firefox" then "firefox"
          elif .class == "Code" then "code"
          else (.class // "default") end)
}'
