#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

cp nitter.example.conf nitter.conf
nimble -l build -d:danger --mm:refc
nim r '--hint[Processing]:off' --dynlibOverride:libsass --passl:"-L$(brew --prefix libsass)/lib" --passl:-lsass tools/gencss
nimble -l md
./nitter
