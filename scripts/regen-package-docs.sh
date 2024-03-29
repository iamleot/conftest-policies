#!/bin/sh

#
# Given a Rego policy as argument generate a README.md from its annotation.
#
# WARNING: no kind of validation is done! It is assumed that OPA metadata
# annotations is also valid Markdown.
#
# Needs opa and jq.
#

set -eu

if [ $# -le 0 ]; then
	echo "usage: $0 <path> [<path> [...]]"
	exit 1
fi

# XXX: Running `opa inspect` directly against paths will fail due:
# XXX:  ..._test.rego:x: rego_unsafe_var_error: var cfg is unsafe
# XXX: because `cfg` depends on functions that are defined only in
# XXX: conftest and not available in OPA.
# XXX: Create a temporary bundle without tests to workaround that.
tmpfile="$(mktemp)"
opa build --bundle --ignore '*_test.rego' --output "${tmpfile}" "$@"
opa inspect --annotations --format json "${tmpfile}" |
jq -r '
	[
		.annotations[] |
		select(.annotations.scope == "package") |
		{
			"path": ([.path[] | .value] | join(".")),
			"title": .annotations.title,
			"description": .annotations.description,
			"references": ((
				[
					.annotations.related_resources[]? |
					"- [\(.description)](\(.ref))"
				] | join("\n")
			) // "")
		}
	] |
	[
		.[] | [
			"# `\(.path)` - \(.title)",
			"",
			"\(.description)",
			(if (.references | length) > 0 then
				"## References\n" +
				"\n" +
				"\(.references)"
			else
				empty
			end)
		] | join("\n")
	] | join("\n\n")
' |
awk '
# Eat all empty lines at the end of file
#
# XXX: It is unclear WTH jq adds them in case of no references.
# XXX: This is a kludge to avoid them!

# Bufferize all empty lines
/^$/ {
	empty_lines++
	next
}

# Non-empty line
{
	# Print all possible empty lines non printed before
	if (empty_lines > 0) {
		for (i = 1; i <= empty_lines; i++) {
			printf "\n"
		}
		empty_lines = 0
	}

	print
}
'

rm -f "${tmpfile}"
