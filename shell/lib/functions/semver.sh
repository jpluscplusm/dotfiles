FUNC=semver_bash
. ${FUNCTION_DIR:-.}/${FUNC}.sh

eval "
semver() {
  ${FUNC} \$1
}
"
