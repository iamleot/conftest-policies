# METADATA
# title: Utility helpers for github.dependabot packages
# description: |
#  Utility helpers for github.dependabot packages providing common code
#  for dealing with GitHub `dependabot.yml` file.
# related_resources:
# - ref: https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file
#   description: Configuration options for the dependabot.yml file
# entrypoint: true
package github.dependabot.utils

import rego.v1

# METADATA
# title: Checks if a string matches GitHub `dependabot.yml` path
# description: |
#  `is_github_dependabot(s)` checks if the path `s` could be GitHub
#  `dependabot.yml` path.
#
#  GitHub `dependabot.yml` should be under `.github` directory.
# related_resources:
# - ref: https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file
#   description: Configuration options for the dependabot.yml file
is_github_dependabot(s) if {
	glob.match("**/.github/dependabot.yml", [], s)
}
