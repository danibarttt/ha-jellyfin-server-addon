#!/usr/bin/with-contenv bashio
set -e

JELLYFIN_ROOT="/data/jellyfin"

bashio::log.info "Jellyfin Server is starting..."

if bashio::config.true 'factory_reset'; then
  bashio::log.warning "Factory reset requested — deleting all Jellyfin data"
  rm -rf "$JELLYFIN_ROOT"
  mkdir -p "$JELLYFIN_ROOT"
fi

mkdir -p \
  "$JELLYFIN_ROOT/data" \
  "$JELLYFIN_ROOT/cache" \
  "$JELLYFIN_ROOT/log"

exec /jellyfin/jellyfin \
  --data-dir  "$JELLYFIN_ROOT/data" \
  --cache-dir "$JELLYFIN_ROOT/cache" \
  --log-dir   "$JELLYFIN_ROOT/log"
