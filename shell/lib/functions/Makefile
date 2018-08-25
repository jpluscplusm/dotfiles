DEFAULT: help

.PHONY: help FORCE test unit bats shellcheck
UNIT_TEST_DIR = Tests/unit
UNIT_TEST_BATS = $(wildcard $(UNIT_TEST_DIR)/*.bats)
FUNCTIONS = $(wildcard *.sh)

test: unit
unit: bats shellcheck

bats: $(UNIT_TEST_BATS)
shellcheck:
	shellcheck --check-sourced --external-sources $(FUNCTIONS)

$(UNIT_TEST_DIR)/%: export FUNCTION_DIR=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
$(UNIT_TEST_DIR)/%: FORCE
	./$@

FORCE: ;

help:
	@echo '  unit: unit tests all functions'
	@echo '  test: tests all functions (currently: unit tests)'
