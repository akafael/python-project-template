##
# Makefile for Python
#
# @author akafael
##

###############################################################################
# Variables
###############################################################################

PYTHON:= python3

# Get Makefile directory as project root
PROJECT_ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

MAIN_SRC:= ${PROJECT_ROOT_DIR}/sample/main.py
TEST_SRC:= ${PROJECT_ROOT_DIR}/test/test_main.py
SETUP_FILE_PATH:= ${PROJECT_ROOT_DIR}/setup.py

VIRTUALENV_PATH := ${PROJECT_ROOT_DIR}/.venv

###############################################################################
# Rules
###############################################################################

# Print help for Makefile commands
.PHONY: help
help:
	@echo "Use: make -f ${PROJECT_ROOT_DIR}/Makefile [OPTION]"
	@echo "\nOPTIONS"
	@sed Makefile -n -e "N;s/^# \(.*\)\n.PHONY:\(.*\)/ \2:\1/p;D" | column -ts:
	@echo ""

# Python Enviroment Preparation Rules ------------------------------------------

# Create Virtualenv
${VIRTUALENV_PATH}: 
	virtualenv ${VIRTUALENV_PATH}

# Create and activate virtualenv enviroment
.PHONY: virtualenv
virtualenv: ${VIRTUALENV_PATH} ${VIRTUALENV_PATH}/bin/activate

# Install Module inside virtual enviroment
.PHONY: install 
install: ${SETUP_FILE_PATH} ${MAIN_SRC} virtualenv
	. "${VIRTUALENV_PATH}/bin/activate" && \
	${PYTHON} ${SETUP_FILE_PATH} install

# Python Rules -----------------------------------------------------------------

# Run Program inside virtual enviroment
.PHONY: run
run: ${MAIN_SRC} virtuaenv
	. "${VIRTUALENV_PATH}/bin/activate" && \
	${PYTHON} $<

# Run unit tests
.PHONY: test
test: ${TEST_SRC} ${MAIN_SRC} install
	. "${VIRTUALENV_PATH}/bin/activate" && \
	${PYTHON} $<


