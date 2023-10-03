# METADATA
# title: Check mandatory top-level keys
# description: |
#  All dependabot.yml files should have `version` and `updates` top-level
#  keys.
# related_resources:
# - ref: https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file
#   description: Configuration options for the dependabot.yml file
# entrypoint: true
package github.dependabot.mandatory_toplevel_keys

import future.keywords.in

import data.github.dependabot.utils

deny_no_updates[msg] {
	f := concat("/", [data.conftest.file.dir, data.conftest.file.name])
	utils.is_github_dependabot(f)
	not input.updates

	msg := "`dependabot.yml` should have an `updates` top-level key"
}

deny_no_version[msg] {
	f := concat("/", [data.conftest.file.dir, data.conftest.file.name])
	utils.is_github_dependabot(f)
	not input.version

	msg := "`dependabot.yml` should have `version` top-level key"
}

deny_incorrect_version[msg] {
	f := concat("/", [data.conftest.file.dir, data.conftest.file.name])
	utils.is_github_dependabot(f)
	not input.version == 2

	msg := "`dependabot.yml` `version` should be 2"
}
