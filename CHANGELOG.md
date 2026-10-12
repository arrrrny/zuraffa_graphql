# Changelog

## 0.1.1

- Drop the local-sibling `dependency_overrides` entry: the hosted
  `zuraffa: ^7.0.0` constraint resolves on its own now that zuraffa 7.x is
  published, so development no longer needs the path pin.
- `test` bumped to `^1.33.0`.

## 0.1.0

- Initial standalone release: split from the zuraffa monorepo
  (`packages/zuraffa_graphql`) into its own repository with full
  git history preserved (issue #1690 §4).
- Publish shape for independent releases: hosted `zuraffa: ^7.0.0`
  constraint with a local-sibling `dependency_overrides` entry for
  development.

