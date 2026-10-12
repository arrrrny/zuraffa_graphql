# Publishing zuraffa_graphql

This package is published to pub.dev under the zuraffa.com publisher.

## No local development override

The `dependency_overrides:` block that used to point `zuraffa` at the local
core checkout (`../zuraffa`) has been removed for good — the published core
version resolves the dependency. Nothing to remove before publishing, and
nothing to restore afterwards.

## Steps

1. Bump `version:` in `pubspec.yaml`.
2. Add the release entry to `CHANGELOG.md`.
3. `dart pub get`
4. `dart format --set-exit-if-changed . && dart analyze && dart test`
5. `dart pub publish --dry-run` — must report no errors.
6. `dart pub publish`

