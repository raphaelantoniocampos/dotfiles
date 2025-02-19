#!/bin/bash

# Detecta o nome da saída eDP
output_name=$(swaymsg -t get_outputs | jq -r '.[] | select(.name | startswith("eDP")) | .name')

wallpaper=/home/$USER/.config/backgrounds/nice-forest-background.jpg

# Verifica se a saída foi detectada
if [ -z "$output_name" ]; then
    echo "Não foi possível detectar a saída eDP."
    exit 1
fi

# Cria um arquivo de configuração temporário
config_file="/home/$USER/.config/sway/output.conf"

# Gera a configuração para o Sway
echo "output $output_name {" > "$config_file"
echo "    background $wallpaper fill" >> "$config_file"
echo "    resolution 1920x1080" >> "$config_file"
echo "    scale 1.0" >> "$config_file"
echo "}" >> "$config_file"

swaymsg reload
