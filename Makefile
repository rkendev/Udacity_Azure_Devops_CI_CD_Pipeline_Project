# Check if running in Azure Cloud Shell
SHELL := /bin/bash
ifneq ($(shell test -e /home/cloudshell-user && echo yes), yes)
	PIP=pip
	PYTHON=python
else
	PIP=~/.myrepo/bin/pip
	PYTHON=~/.myrepo/bin/python
endif

install:
	$(PIP) install --upgrade pip && $(PIP) install -r requirements.txt

test:
	$(PYTHON) -m pytest -vv test_hello.py

lint:
	$(PYTHON) -m pylint --disable=R,C hello.py

all: install lint test
