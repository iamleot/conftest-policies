package github.dependabot.utils_test

import rego.v1

import data.github.dependabot.utils

test_is_github_dependabot if {
	utils.is_github_dependabot("/some/path/.github/dependabot.yml")
	utils.is_github_dependabot("/.github/dependabot.yml")
}

test_is_not_github_dependabot if {
	not utils.is_github_dependabot("/some/path/.github/workflows/dependabot.yml")
	not utils.is_github_dependabot("/some/path/dependabot.yml")
	not utils.is_github_dependabot("/some/path/.github/dependabot.yaml")
}
