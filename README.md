# zuraffa_graphql

GraphQL capability for [Zuraffa](https://pub.dev/packages/zuraffa) — the GraphQL
client surface, schema-driven datasource generation, and `.gql` document
tooling.

This is an **optional companion package**: it carries the heavyweight
`graphql`/`gql` dependency stack so that core-only consumers stay lean
(issue [#1661](https://github.com/arrrrny/zuraffa/issues/1661)). In zuraffa
≤6.x these APIs lived in `package:zuraffa` itself — see the
[core CHANGELOG](https://github.com/arrrrny/zuraffa/blob/master/CHANGELOG.md)
for the full migration map.

## Features

- **Client wiring** — `GraphQLClientFactory`, `GraphQLClientProvider`,
  `SubscriptionStream<T>`, `GraphQLClientConfig`
- **Schema-driven codegen** — `DatasourceGenerator`, `DiGenerator`,
  `SliceOrchestrator`
- **`.gql` documents** — `GraphqlDocumentBuilder`, `DocumentsDartGenerator`,
  `NamingUtils`, `GqlFilePreserver`
- **Validation & commands** — `GraphQLValidator`, `GraphqlGenerateCommand`

## Install

```bash
dart pub add zuraffa_graphql
```

Requires `zuraffa: ^7.0.0`.

## Usage

Enable the capability in your Zuraffa project:

```bash
zfa plugin enable graphql
```

Then import the surface you need:

```dart
import 'package:zuraffa_graphql/zuraffa_graphql.dart';
```

## Development

This repository is a standalone split from the core `zuraffa` monorepo
(issue [#1690](https://github.com/arrrrny/zuraffa/issues/1690) §4) with full
git history preserved. Its `pubspec.yaml` declares a hosted
`zuraffa: ^7.0.0` constraint plus a `dependency_overrides` entry resolving
`zuraffa` to the local core checkout — so a sibling checkout of
[arrrrny/zuraffa](https://github.com/arrrrny/zuraffa) at `../zuraffa` is
required for `dart pub get`, `dart analyze`, and `dart test`:

```text
~/Developer/
├── zuraffa/           # core checkout (any branch)
└── zuraffa_graphql/   # this repository
```

CI provides that sibling checkout automatically. See
[PUBLISH.md](PUBLISH.md) before releasing.

## Links

- [Repository](https://github.com/arrrrny/zuraffa_graphql)
- [Issue tracker](https://github.com/arrrrny/zuraffa_graphql/issues)
- [Zuraffa core](https://github.com/arrrrny/zuraffa) ·
  [zuraffa on pub.dev](https://pub.dev/packages/zuraffa)
