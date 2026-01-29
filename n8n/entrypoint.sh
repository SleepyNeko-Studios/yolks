#!/bin/sh

cd /home/container || exit

export N8N_PORT="$SERVER_PORT"

echo "n8n: $(n8n --version)"
echo "node: $(node -v)"

exec "tini -- /docker-entrypoint.sh"
