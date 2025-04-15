#!/bin/sh

BIB_FILE="data/bibliography.json"

mkdir -p data

curl -s "https://api.zotero.org/groups/5010351/items?format=json" \
  | jq '[.[] | .data]' > "$BIB_FILE"