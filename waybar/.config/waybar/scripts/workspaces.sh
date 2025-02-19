#!/bin/bash

workspaces=$(swaymsg -t get_workspaces)

echo "$workspaces" | jq -c '
  {
    text: "Workspaces",
    tooltip: "Workspaces ativos",
    workspaces: map({
      name: .name,
      focused: .focused,
      icon: (if .focused then "<span color=\"#a6e3a1\"></span>" else "<span color=\"#89dceb\">\(.name)</span>" end)
    })
  }
'
