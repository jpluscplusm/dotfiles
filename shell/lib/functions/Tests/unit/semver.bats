#!/usr/bin/env bats

it="$(basename "$BATS_TEST_FILENAME" .bats)"
. "${it}.sh"

@test "$it: patch bumps 0.0.0 correctly" {
  run "$it" 0.0.0
  # shellcheck disable=SC2154
  [ "$output" = "0.0.1" ]
}

@test "$it: patch bumps 0.0.20 correctly" {
  run "$it" 0.0.20
  # shellcheck disable=SC2154
  [ "$output" = "0.0.21" ]
}

@test "$it: patch bumps 1.0.0 correctly" {
  run "$it" 1.0.0
  # shellcheck disable=SC2154
  [ "$output" = "1.0.1" ]
}

@test "$it: patch bumps 1.9.8 correctly" {
  run "$it" 1.9.8
  # shellcheck disable=SC2154
  [ "$output" = "1.9.9" ]
}

@test "$it: patch bumps 1.9.9 correctly" {
  run "$it" 1.9.9
  # shellcheck disable=SC2154
  [ "$output" = "1.9.10" ]
}

@test "$it: patch bumps 1.5.<random-number> correctly" {
  a_random_number=$RANDOM
  one_greater="$(echo $a_random_number + 1 | bc -ql)"
  semver_before="1.5.$a_random_number"
  semver_after="1.5.$one_greater"
  run "$it" $semver_before
  # shellcheck disable=SC2154
  [ "$output" = "$semver_after" ]
}
