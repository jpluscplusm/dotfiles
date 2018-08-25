#!/usr/bin/env bats

it=add
source "${it}.sh"

@test "$it: returns 2 when given 1 and 1" {
  output="$( { echo 1; echo 1; } | $it)"
  [ "$output" -eq 2 ]
}

@test "$it: returns 4 when given 2 and 2" {
  output="$( { echo 2; echo 2; } | $it)"
  [ "$output" -eq 4 ]
}

@test "$it: returns 55 when given all numbers between 1 and 10" {
  output="$(seq 1 10 | $it)"
  [ "$output" -eq 55 ]
}

@test "$it: returns the same number when given only 1 number" {
  a_random_number=$RANDOM
  output="$(echo $a_random_number | $it)"
  [ "$output" -eq $a_random_number ]
}
