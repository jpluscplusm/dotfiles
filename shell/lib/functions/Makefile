DEFAULT: help
MAKEFLAGS += --keep-going

.PHONY: test unit help FORCE
UNIT_TEST_DIR = Tests/unit
UNIT_TESTS = $(wildcard $(UNIT_TEST_DIR)/*.bats)

test: unit
unit: $(UNIT_TESTS)

$(UNIT_TEST_DIR)/%: export FUNCTION_DIR=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
$(UNIT_TEST_DIR)/%: FORCE
	./$@

FORCE: ;

help:
	@echo '  unit: unit tests all functions'
	@echo '  test: tests all functions (currently: unit tests)'
