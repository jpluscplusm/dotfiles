#!/usr/bin/env bats

it=rename
source "${it}.sh"

@test "$it: does nothing if given no input" {
  skip
}
