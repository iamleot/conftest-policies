# METADATA
# title: Utility helpers for github.actions.workflows packages
# description: |
#  Utility helpers for github.actions.workflows packages providing common code
#  for dealing with GitHub Actions workflows.
# related_resources:
# - ref: https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions
#   description: Workflow syntax for GitHub Actions
# entrypoint: true
package github.actions.workflows.utils

import rego.v1

# METADATA
# title: Checks if a string matches GitHub Actions workflows path
# description: |
#  `is_github_workflows(s)` checks if the path `s` could be GitHub Actions
#  workflows path.
#
#  GitHub Actions workflows should be under `.github/workflows` directory and
#  should ends with `.yml` or `.yaml` file extensions.
# related_resources:
# - ref: https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions
#   description: Workflow syntax for GitHub Actions
is_github_workflows(s) if {
	glob.match("**/.github/workflows/*.yml", [], s)
}

is_github_workflows(s) if {
	glob.match("**/.github/workflows/*.yaml", [], s)
}
