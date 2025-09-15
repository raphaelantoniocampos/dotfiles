#!/bin/sh

CONFIG="$HOME/.config/scripts/translate_langs.conf"
LANGS="pt-BR\nen\nes\nfr\nde\nit\nja\nzh"

# creates default translate conf
if [[ ! -f "$CONFIG" ]]; then
    echo "pt-BR:en" > "$CONFIG"
fi

if [[ "$1" == "set" ]]; then
    # choose new langs
    FROM=$(echo -e "$LANGS" | wofi --dmenu -p "origin")
    [ -z "$FROM" ] && exit 0

    TO=$(echo -e "$LANGS" | wofi --dmenu -p "destination")
    [ -z "$TO" ] && exit 0

    echo "$FROM:$TO" > "$CONFIG"

    hyprctl notify 1 5000 1 "updated default languages" "$FROM → $TO"
    exit 0
fi

# read langs
IFS=":" read FROM TO < "$CONFIG"

# get text
hyprctl notify 2 5000 1 "Translating - $FROM → $TO"
TEXT=$(wofi --dmenu -p "$FROM → $TO" --lines=1 --width=600)

[ -z "$TEXT" ] && exit 0

# translate
RESULT=$(trans -b "$FROM:$TO" "$TEXT")

# copy to clipboard
echo -n "$RESULT" | wl-copy

# notify
hyprctl notify 2 5000 1 "$RESULT (copied to clipboard)"

