#!/usr/bin/env bash
set -eou pipefail

GPG_BIN=""
USE_LOOPBACK=0

case "$OSTYPE" in
    linux*)
        GPG_BIN="/usr/bin/gpg"
        USE_LOOPBACK=1
        ;;
    msys*)
        if [[ -x "/c/Program Files/Git/usr/bin/gpg.exe" ]]; then
            GPG_BIN="/c/Program Files/Git/usr/bin/gpg.exe"
        fi
        USE_LOOPBACK=0
        ;;
    *)
        echo "Unsupported OS: $OSTYPE" >&2
        exit 1
        ;;
esac

if [[ $USE_LOOPBACK -eq 1 ]]; then
    exec "$GPG_BIN" --pinentry-mode=loopback "$@"
else
    exec "$GPG_BIN" "$@"
fi