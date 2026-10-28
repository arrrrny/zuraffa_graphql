## [7.3.0] - 2026-10-28

- Mono-version fleet alignment: the whole zuraffa family ships at 7.3.0 together with the core.
- `zuraffa` dependency constraints unified to ^7.3.0; cross-family constraints move with the release.
- Fleet-wide `dependency_overrides: xml: 7.1.0`; README install guides refreshed to 7.3.0.

## [7.2.0] - 2026-10-28

- Mono-version fleet alignment: the whole zuraffa family now ships at the same version as the core.
- `zuraffa` dependency constraint unified to ^7.2.0 across the fleet.
- zuraffa_storage now wraps the maintained `zuraffa_minio` fork instead of the abandoned `minio` package (xml 7 compatible).
- Fleet-wide `dependency_overrides: xml: 7.1.0` policy; README install guides refreshed to the release version.

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

