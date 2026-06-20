#!/usr/bin/env bash
# Publish about.ifuri.com (static presentation).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REMOTE="${IFURI_DEPLOY_HOST:-ifuri@ifuri.com}"
DOCROOT="${IFURI_ABOUT_DOCROOT:-/var/www/vhosts/ifuri.com/about.ifuri.com}"
echo "== deploy about.ifuri.com -> ${REMOTE}:${DOCROOT} =="
rsync -az --delete \
  --exclude '.git' --exclude 'scripts' --exclude 'Makefile' \
  --exclude '.github' --exclude '*.md' --exclude 'CNAME' \
  "${ROOT}/" "${REMOTE}:${DOCROOT}/"
ssh "${REMOTE}" "cd '${DOCROOT}' && find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +"
curl -fsSI "https://about.ifuri.com/" | head -3 || true
echo done
