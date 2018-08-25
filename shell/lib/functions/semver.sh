#!/usr/bin/env bash
FUNC=semver_bash
# shellcheck source=./semver_bash.sh
. "${FUNCTION_DIR:-.}/${FUNC}.sh"

eval "
semver() {
  ${FUNC} \$1
}
"
