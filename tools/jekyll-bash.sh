#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

#--------------------------------------------------------------------
# config

CONTAINER_NAME=jekyll-bash
BLOG_HOME=$DIR/..
GEM_CACHE_DIR=$DIR/.gemcache
JEKYLL_SERVE_PORT=4000

#--------------------------------------------------------------------

mkdir -p $GEM_CACHE_DIR

docker run --rm -it \
  --name ${CONTAINER_NAME} \
  --volume="${BLOG_HOME}:/srv/jekyll" \
  --volume="${GEM_CACHE_DIR}:/usr/gem/cache" \
  -p ${JEKYLL_SERVE_PORT}:${JEKYLL_SERVE_PORT} \
  jekyll/jekyll:4.0.0 bash
