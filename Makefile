.POSIX:

CONFTEST = conftest
REGAL = regal

all:

check-fmt:
	@echo "Checking Rego formatting style"
	@$(CONFTEST) fmt --check .

fmt:
	@echo "Formatting Rego files"
	@$(CONFTEST) fmt .

lint:
	@echo "Linting Rego files"
	@$(REGAL) lint .

test:
	@echo "Unit testing conftest rules"
	@$(CONFTEST) verify --policy .
