.POSIX:

CONFTEST = conftest
REGAL = regal
REGEN_DOCS = ./scripts/regen-docs.sh

all:

check-fmt:
	@echo "Checking Rego formatting style"
	@$(CONFTEST) fmt --check .

docs:
	@echo "Regenerating documentation"
	@$(REGEN_DOCS)

fmt:
	@echo "Formatting Rego files"
	@$(CONFTEST) fmt .

lint:
	@echo "Linting Rego files"
	@$(REGAL) lint .

test:
	@echo "Unit testing conftest rules"
	@$(CONFTEST) verify --policy .
