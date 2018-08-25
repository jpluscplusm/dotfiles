semver_bash() {
  echo $1 | \
    awk -v{O,}FS=. '{print $1, $2, $3+1}'
}
