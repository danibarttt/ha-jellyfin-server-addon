#!/usr/bin/with-contenv bashio
set -e

JELLYFIN_ROOT="/data/jellyfin"
RESET_FLAG="/data/factory_reset"

bashio::log.info "Jellyfin Server is starting..."

if [ -f "$RESET_FLAG" ]; then
  bashio::log.warning "Factory reset flag detected — wiping data"
  rm -rf "$JELLYFIN_ROOT"
  rm -f "$RESET_FLAG"
fi

mkdir -p \
  "$JELLYFIN_ROOT/data" \
  "$JELLYFIN_ROOT/cache" \
  "$JELLYFIN_ROOT/log"

exec /jellyfin/jellyfin \
  --data-dir  "$JELLYFIN_ROOT/data" \
  --cache-dir "$JELLYFIN_ROOT/cache" \
  --log-dir   "$JELLYFIN_ROOT/log"
