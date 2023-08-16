package github.dependabot.utils

test_is_github_dependabot {
	is_github_dependabot("/some/path/.github/dependabot.yml")
	is_github_dependabot("/.github/dependabot.yml")
}

test_is_not_github_dependabot {
	not is_github_dependabot("/some/path/.github/workflows/dependabot.yml")
	not is_github_dependabot("/some/path/dependabot.yml")
	not is_github_dependabot("/some/path/.github/dependabot.yaml")
}
