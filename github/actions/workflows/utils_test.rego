package github.actions.workflows.utils

test_is_github_workflows {
	is_github_workflows("/some/path/.github/workflows/yes.yml")
	is_github_workflows("/some/path/.github/workflows/yes.yaml")
	is_github_workflows("/.github/workflows/yes.yml")
}

test_is_not_github_workflows {
	not is_github_workflows("/some/path/.github/other_dir.yml")
	not is_github_workflows("/some/path/workflows/other_dir.yml")
	not is_github_workflows("/some/path/.github/workflows/not_yml.txt")
}
