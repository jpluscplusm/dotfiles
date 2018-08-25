#!/usr/bin/env bats

it=add
source "add.sh"

@test "$it: returns 2 when given 1 and 1" {
  input="1\n1\n"
  result="$(echo -ne $input | $it)"
  [ "$result" -eq 2 ]
}

@test "$it: returns 4 when given 2 and 2" {
  input="2\n2\n"
  result="$(echo -ne "2\n2\n" | $it)"
  [ "$result" -eq 4 ]
}

@test "$it: returns 55 when given all numbers between 1 and 10" {
  result="$(seq 1 10 | $it)"
  [ "$result" -eq 55 ]
}

@test "$it: returns the same number when given only 1 number" {
  a_random_number=$RANDOM
  result="$(echo $a_random_number | $it)"
  [ "$result" -eq $a_random_number ]
}
