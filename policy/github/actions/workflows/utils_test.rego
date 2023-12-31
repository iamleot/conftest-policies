package github.actions.workflows.utils_test

import future.keywords.if

import data.github.actions.workflows.utils

test_is_github_workflows if {
	utils.is_github_workflows("/some/path/.github/workflows/yes.yml")
	utils.is_github_workflows("/some/path/.github/workflows/yes.yaml")
	utils.is_github_workflows("/.github/workflows/yes.yml")
}

test_is_not_github_workflows if {
	not utils.is_github_workflows("/some/path/.github/other_dir.yml")
	not utils.is_github_workflows("/some/path/workflows/other_dir.yml")
	not utils.is_github_workflows("/some/path/.github/workflows/not_yml.txt")
}
