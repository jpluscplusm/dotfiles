#!/usr/bin/env bats

it=rename
source "${it}.sh"

setup() {
  dir="$(mktemp -d)"
}

teardown() {
  rm "$dir"/*
  rmdir "$dir/"
}

@test "$it: does nothing if given no input" {
  run rename
  # shellcheck disable=SC2154
  [ "$status" -eq 0 ]
  # shellcheck disable=SC2154
  [ "$output" = "" ]
}

@test "$it: renames a single file" {
  cd "$dir"
  content=$RANDOM
  echo "$content" >"foo"
  run rename 's/foo/bar/' "foo"
  [ "$status" -eq 0 ]
  [ -e "bar" ]
  [ ! -e "foo" ]
  grep -q "$content" "bar"
}

@test "$it: renames multiple files by changing their suffix" {
  cd "$dir"
  filelist="$(seq 1 5)"
  for I in $filelist; do touch "file.$I.old"; done
  run rename 's/old$/new/' file.*
  [ "$status" -eq 0 ]
  for I in $filelist; do
    [ -e "file.$I.new" ]
    [ ! -e "file.$I.old" ]
  done
}

@test "$it: renames multiple files by changing their prefix" {
  cd "$dir"
  filelist="$(seq 1 5)"
  for I in $filelist; do touch "old.$I.file"; done
  run rename 's/^old/new/' old.*
  [ "$status" -eq 0 ]
  for I in $filelist; do
    [ -e "new.$I.file" ]
    [ ! -e "old.$I.file" ]
  done
}

@test "$it: renames multiple files by changing a regex'd string in the middle of their name" {
  cd "$dir"
  filelist="$(seq 1 5)"
  for I in $filelist; do touch "an.old.$I.file"; done
  run rename 's/old/new/' *.file
  [ "$status" -eq 0 ]
  for I in $filelist; do
    [ -e "an.new.$I.file" ]
    [ ! -e "an.old.$I.file" ]
  done
}

@test "$it: complains if it's about to overwrite files" {
  skip
}
