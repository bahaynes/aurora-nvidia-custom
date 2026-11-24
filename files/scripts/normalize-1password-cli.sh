#!/usr/bin/env bash
set -euo pipefail

# Keep the CLI binary aligned with its RPM metadata. A setgid, user-group-owned
# op binary breaks 1Password's authenticated desktop-app integration.
chown root:root /usr/bin/op
chmod 0755 /usr/bin/op

if rpm -V 1password-cli | grep -qE '[[:space:]]/usr/bin/op$'; then
  printf '1password-cli verification failed for /usr/bin/op\n' >&2
  exit 1
fi
