# zuraffa_graphql

Optional [Zuraffa](https://github.com/arrrrny/zuraffa) capability package
(issue #1661): carries the heavyweight dependencies so the core package
stays lean.

## Enable

```bash
zfa plugin enable graphql
```

Then add the repository-local package to your pubspec:

```yaml
dependencies:
  zuraffa_graphql:
    path: packages/zuraffa_graphql
```

Then run `dart pub get`.

## Development

This repository is a standalone split from the core `zuraffa` monorepo
(issue #1690 §4). Its `pubspec.yaml` declares a hosted `zuraffa: ^7.0.0`
constraint plus a `dependency_overrides` entry resolving `zuraffa` to the
local core checkout — so a sibling checkout of
[arrrrny/zuraffa](https://github.com/arrrrny/zuraffa) at `../zuraffa` is
required for `dart pub get`, `dart analyze`, and `dart test`:

```text
~/Developer/
├── zuraffa/                  # core checkout (any branch)
└── $THIS_PACKAGE/            # this repository
```

CI provides that sibling checkout automatically. See `PUBLISH.md` before
releasing.
