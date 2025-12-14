#!/bin/sh

CONFIG="$HOME/.config/scripts/translate_langs.conf"
LANGS="pt-BR\nen\nes\nfr\nde\nit\nja\nzh"

# creates default translate conf
if [[ ! -f "$CONFIG" ]]; then
    echo "pt-BR:en" > "$CONFIG"
fi

if [[ "$1" == "set" ]]; then
    # choose new langs
    FROM=$(echo -e "$LANGS" | wofi --dmenu -p "origin" --lines=5 --width=300)
    [ -z "$FROM" ] && exit 0

    TO=$(echo -e "$LANGS" | wofi --dmenu -p "destination" --lines=5 --width=300)
    [ -z "$TO" ] && exit 0

    echo "$FROM:$TO" > "$CONFIG"

    hyprctl notify 1 5000 1 "updated default languages" "$FROM → $TO"
    exit 0
fi

if [[ "$1" == "switch" ]]; then
    # switch languages
    IFS=":" read FROM TO < "$CONFIG"
    echo "$TO:$FROM" > "$CONFIG"

    hyprctl notify 1 5000 1 "switch languages" "$TO → $FROM"
    exit 0
fi

# read langs
IFS=":" read FROM TO < "$CONFIG"

if [[ "$1" == "auto" ]]; then
    hyprctl notify 2 5000 1 "Translating (clipboard) - $FROM → $TO"
    TEXT=$(wl-paste -n)
else
    hyprctl notify 2 5000 1 "Translating - $FROM → $TO"
    TEXT=$(wofi --dmenu -p "$FROM → $TO" --lines=1 --width=600)
fi

[ -z "$TEXT" ] && exit 0

# count words
WORD_COUNT=$(echo "$TEXT" | wc -w)

# notification time based on word count
TIME_MS=$((WORD_COUNT * 1000))
[ "$TIME_MS" -lt 2000 ] && TIME_MS=2000
[ "$TIME_MS" -gt 10000 ] && TIME_MS=10000

# translate
RESULT=$(trans -b "$FROM:$TO" "$TEXT")

# copy to clipboard
echo -n "$RESULT" | wl-copy

# notify
hyprctl notify 1 "$TIME_MS" 1 "(copied to clipboard)"
hyprctl notify 5 "$TIME_MS" 1 "$RESULT"

