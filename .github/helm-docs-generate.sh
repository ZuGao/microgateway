#!/bin/bash
set -euo pipefail

# Write Error Message
echo -e "\033[0;31m ######## The helm-docs validation failed. ######## \033[0m" >&2
echo -e "\033[0;31m Make sure that the documentation has been updated. \033[0m" >&2

./helm-docs
git add .
git commit -m "Automated README generation"
git push
