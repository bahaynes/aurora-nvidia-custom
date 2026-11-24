#!/usr/bin/env bash
set -euo pipefail

# Keep the CLI and desktop integration helpers aligned with their RPM metadata.
# Altered ownership or setgid bits make the desktop app reject authenticated IPC
# connections from op.
rpm --restore 1password 1password-cli

if rpm -V 1password 1password-cli \
  | grep -E '^[^[:space:]]*[MUG][^[:space:]]*[[:space:]]+' \
  | grep -qE '[[:space:]](/usr/bin/op|/opt/1Password/(1password|1Password-BrowserSupport|1password-mcp|chrome-sandbox))$'; then
  printf '1Password integration helper metadata verification failed\n' >&2
  exit 1
fi
