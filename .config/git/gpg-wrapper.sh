#!/usr/bin/env bash
set -a
source ~/gpg.env
set +a

exec gpg --local-user "$GPG_KEY" "$@"
