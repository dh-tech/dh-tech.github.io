#!/bin/bash

# save as render-build.sh and make sure it's executable
# Hugo version is shared with GitHub Actions via .hugo-version.

hugo version # Output the OLD version

HUGO_VERSION=$(cat .hugo-version)
HUGO_BIN="${XDG_CACHE_HOME:-$HOME/.cache}/hugo-$HUGO_VERSION"
OS_VERSION="Linux-64bit"
#OS_VERSION="darwin-universal"  # uncomment to test on mac osx

./themes/hugo-bibliography/fetch-zotero.sh

if [[ ! -x "$HUGO_BIN" ]]; then
  echo "...Downloading HUGO"
  mkdir -p ~/tmp
  wget -P ~/tmp https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_${OS_VERSION}.tar.gz
  cd ~/tmp
  echo "...Extracting HUGO"
  tar -xzvf hugo_extended_${HUGO_VERSION}_${OS_VERSION}.tar.gz
  echo "...Moving HUGO"
  mkdir -p "$(dirname "$HUGO_BIN")"
  mv hugo "$HUGO_BIN"
  cd $HOME/project/src # Make sure we return to where we were
else
  echo "...Using HUGO from build cache"
fi

"$HUGO_BIN" version # Output the NEW version

# Render sets IS_PULL_REQUEST to true for PR previews.
if [ "${IS_PULL_REQUEST:-}" = "true" ]; then
    echo "Base url:"
    echo $RENDER_EXTERNAL_URL
    "$HUGO_BIN" --gc -e preview -b "$RENDER_EXTERNAL_URL"
else
    "$HUGO_BIN" --gc --minify -b https://dh-tech.onrender.com/

fi
