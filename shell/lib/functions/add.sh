#!/usr/bin/env bash
add() {
  awk '{s+=$1}END{print s}'
}
