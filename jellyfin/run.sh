#!/usr/bin/with-contenv bashio
set -e

JELLYFIN_ROOT="/data/jellyfin"

bashio::log.info "Jellyfin Server is starting..."

# Factory reset (before Jellyfin starts)
if bashio::config.true 'factory_reset'; then
  bashio::log.warning "Factory reset requested — wiping Jellyfin data"
  rm -rf "$JELLYFIN_ROOT"
  mkdir -p "$JELLYFIN_ROOT"
  bashio::config.write 'factory_reset' false
fi

# Create required directories
mkdir -p \
  "$JELLYFIN_ROOT/data" \
  "$JELLYFIN_ROOT/cache" \
  "$JELLYFIN_ROOT/log"

# Start Jellyfin with explicit paths
exec /jellyfin/jellyfin \
  --data-dir  "$JELLYFIN_ROOT/data" \
  --cache-dir "$JELLYFIN_ROOT/cache" \
  --log-dir   "$JELLYFIN_ROOT/log"
