## 7.4.2 - 2026-11-12

Adopt `graphql_plus` ^5.2.6 (pub.dev, arrrrny fork) in place of stock `graphql` `^5.2.4` -- ships the QueryManager double-completion hardening (guarded settle, subscription cancellation, `No element` on empty streams) that is the root cause behind the vendure #4/#8 timeout-storm family. Import surface and generated-code semantics unchanged: `package:graphql/client.dart` becomes `package:graphql_plus/graphql_plus.dart` (the fork keeps the identical export barrel and lib/src layout). Closes #1.

Maintenance note: `graphql_plus` is a temporary fork published by an unverified uploader, and this package takes its whole network stack from it. The exit plan is to move back to upstream `graphql` as soon as it ships the QueryManager fix; prefer a verified publisher for the fork in the meantime. Track this in #1.

## 7.4.1 - 2026-11-11

Fleet release 7.4.1: core adds zfa tunnel (Cloudflare-hosted MCP servers), MCP streamable-HTTP transport with usecase tools, blocking lifecycle hooks (#2032), typed tool param coercion (#2061); whole fleet mono-aligned to 7.4.1.

## 7.3.6 - 2026-11-02

- Mono-version fleet alignment to 7.3.6; internal dependencies refreshed; xml override 7.1.0.

## 7.3.2 - 2026-10-31

Mono-version fleet alignment to 7.3.2: outbound send port lands in zuraffa_intents (shareText/shareFiles behind ShareIntentService); the whole family ships at one version.

## 7.3.0 - 2026-10-28

- Mono-version fleet alignment: the whole zuraffa family ships at 7.3.0 together with the core.
- `zuraffa` dependency constraints unified to ^7.3.0; cross-family constraints move with the release.
- Fleet-wide `dependency_overrides: xml: 7.1.0`; README install guides refreshed to 7.3.0.

## 7.2.0 - 2026-10-28

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

