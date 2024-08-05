##
#
##

PYTHON:= python3

MAIN_SRC:= src/main.py
TEST_SRC:= src/test_main.py

.PHONY: run
run: ${MAIN_SRC}
	${PYTHON} $<

.PHONY: test
test: ${TEST_SRC}
	${PYTHON} $<

