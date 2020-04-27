#!/bin/bash
set -euo pipefail

# validate docs
./helm-docs
git diff --exit-code
