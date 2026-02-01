#!/usr/bin/with-contenv bashio
set -e

bashio::log.info "Jellyfin Server is starting..."

JELLYFIN_ROOT="/data/jellyfin"

mkdir -p \
  "$JELLYFIN_ROOT/data" \
  "$JELLYFIN_ROOT/cache" \
  "$JELLYFIN_ROOT/log"

exec /jellyfin/jellyfin \
  --data-dir  "$JELLYFIN_ROOT/data" \
  --cache-dir "$JELLYFIN_ROOT/cache" \
  --log-dir   "$JELLYFIN_ROOT/log"
