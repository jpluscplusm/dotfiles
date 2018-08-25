semver_portable() {
  awk -vx=$1 'BEGIN{split(x,a,".");print a[1]"."a[2]"."a[3]+1}'
}
