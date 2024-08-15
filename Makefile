# Check if running in Azure Cloud Shell
SHELL := /bin/bash
ifneq ($(shell test -e /home/cloudshell-user && echo yes), yes)
	PIP=pip
	PYTHON=python
	VENV_ACTIVATE=.udacity-devops\Scripts\Activate.ps1
else
	PIP=~/.udacity-devops/bin/pip
	PYTHON=~/.udacity-devops/bin/python
	VENV_ACTIVATE=.udacity-devops/bin/activate
endif

setup:
	python -m venv .udacity-devops

install:
	$(PIP) install --upgrade pip && $(PIP) install -r requirements.txt

test:
	$(PYTHON) -m pytest -vv --cov=myrepolib tests/*.py
	coverage report -m
	$(PYTHON) -m pytest --nbval notebook.ipynb

lint:
	$(PYTHON) -m pylint --disable=R,C,W1203,W0702 app.py

all: install lint test
