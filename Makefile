.POSIX:

CONFTEST = conftest

all:

check-fmt:
	@echo "Checking Rego formatting style"
	@$(CONFTEST) fmt --check .

fmt:
	@echo "Formatting Rego files"
	@$(CONFTEST) fmt .

test:
	@echo "Unit testing conftest rules"
	@$(CONFTEST) verify --policy .
