#!/bin/sh

#
# Helper script to regenarate all documentation
#
# Should be executed from root directory where policy/ is present.
#

set -eu

: ${REGEN_PACKAGE_DOCS:="./scripts/regen-package-docs.sh"}

find . -name '*.rego' -exec dirname {} \; | sort -u | while read d; do
	${REGEN_PACKAGE_DOCS} "${d}" > "${d}/README.md"
done
