#!/usr/bin/env bash
set -euo pipefail

# 1Password verifies the CLI's GID on its Unix socket. The CLI must run with
# the onepassword-cli group via its setgid bit; RPM metadata alone does not
# preserve that post-install requirement in the composed image.
if ! getent group onepassword-cli >/dev/null; then
  printf 'required onepassword-cli group is missing\n' >&2
  exit 1
fi

chown root:onepassword-cli /usr/bin/op
chmod 2755 /usr/bin/op

if [[ "$(stat -c '%U:%G:%a' /usr/bin/op)" != 'root:onepassword-cli:2755' ]]; then
  printf '1Password CLI metadata verification failed\n' >&2
  exit 1
fi
