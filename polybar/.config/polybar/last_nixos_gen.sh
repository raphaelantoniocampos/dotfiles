#!/bin/bash
# current_generation.sh

# Obtenha a geração atual
current_gen=$(nixos-rebuild list-generations | awk '/current/ {print $1}')

# Exiba a geração atual
echo $current_gen
