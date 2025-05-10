#!/bin/bash

# save as render-build.sh and make sure it's executable
# update the version being used to match version being used in build

hugo version # Output the OLD version

HUGO_VERSION=0.142.0
OS_VERSION="Linux-64bit"
#OS_VERSION="darwin-universal"  # uncomment to test on mac osx

./themes/hugo-bibliography/fetch-zotero.sh

if [[ ! -f $XDG_CACHE_HOME/hugo ]]; then
  echo "...Downloading HUGO"
  mkdir -p ~/tmp
  wget -P ~/tmp https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_${OS_VERSION}.tar.gz
  cd ~/tmp
  echo "...Extracting HUGO"
  tar -xzvf hugo_extended_${HUGO_VERSION}_${OS_VERSION}.tar.gz
  echo "...Moving HUGO"
  mv hugo $XDG_CACHE_HOME/hugo
  cd $HOME/project/src # Make sure we return to where we were
else
  echo "...Using HUGO from build cache"
fi

$XDG_CACHE_HOME/hugo version # Output the NEW version

# Render sets IS_PULL_REQUEST to true for PR previews.
if [ "${IS_PULL_REQUEST:-}" = "true" ]; then
    echo "Base url:"
    echo $RENDER_EXTERNAL_URL
    $XDG_CACHE_HOME/hugo --gc -e preview -b $RENDER_EXTERNAL_URL
else
    $XDG_CACHE_HOME/hugo --gc --minify -b https://dh-tech.onrender.com/

fi
