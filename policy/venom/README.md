# `data.venom.name` - Check `name` keys for test suite, test cases and steps

Venom permit to have `name` keys for test suite, test cases and steps.

The `name` field serves as a short description and is used in several ways
in the report of Venom. For test cases it is used as an identifier to
permit referencing test variables.

Enforcing that is always present make the Venom tests more readable.

## References

- [Venom | Concepts](https://github.com/ovh/venom#concepts)

# `data.venom.timeout` - Enforce `timeout` key for tests

Test steps can hangs indefinitely if they do not define a `timeout`.

Always define a `timeout` in all tests to avoid that.

If for some reason this needs to be bypassed, explicitly set `timeout`
to 0.

## References

- [CWE-400: Uncontrolled Resource Consumption](https://cwe.mitre.org/data/definitions/400.html)
