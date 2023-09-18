# `data.github.actions.workflows.name` - Check `name` keys for workflow, job and steps

GitHub Actions workflows permit to have `name` keys for workflows, jobs and
steps.

The `name` field serves as a short description of workflow/job/step and it
is used in several ways in the UI of GitHub Actions.

Enforcing that is always present make the GitHub Actions workflow more
readable and avoid machine-generated `name` that can be hard to follow.

## References

- [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)

# `data.github.actions.workflows.setup_version` - Check that `*-version` in `setup-*` actions is a string

The `*-version` parameters in GitHub Actions workflows `setup-*` should be
a string in order to properly work with versions.

By omitting string in YAML it can fallback to be parsed as a float and
accidentally truncate any possible trailing `0`.

For example, by using `go-version: 1.20` intended to require Go `1.20`
it will be actually parsed as `go-version: 1.2` and Go `1.2` will
be used instead!

## References

- [GitHub - actions/setup-go](https://github.com/actions/setup-go)
- [GitHub - actions/setup-java](https://github.com/actions/setup-java)
- [GitHub - actions/setup-node](https://github.com/actions/setup-node)
- [GitHub - actions/setup-python](https://github.com/actions/setup-python)

# `data.github.actions.workflows.utils` - Utility helpers for github.actions.workflows packages

Utility helpers for github.actions.workflows packages providing common code
for dealing with GitHub Actions workflows.

## References

- [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
