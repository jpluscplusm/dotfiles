#!/usr/bin/env bats

it=rename
source "${it}.sh"

@test "$it: FAILS" {
  false
}
