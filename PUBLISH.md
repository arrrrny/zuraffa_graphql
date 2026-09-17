# Publishing zuraffa_graphql

This package is published to pub.dev under the zuraffa.com publisher.

## Prerequisite: remove the local development override

`pubspec.yaml` carries a `dependency_overrides` entry pointing `zuraffa`
at the local core checkout (`../zuraffa`) so development and CI work
before a matching core version is published. `dart pub publish` refuses
to publish with overrides present — remove the whole
`dependency_overrides:` block before publishing.

## Steps

1. Bump `version:` in `pubspec.yaml`.
2. Add the release entry to `CHANGELOG.md`.
3. Remove the `dependency_overrides:` block from `pubspec.yaml`.
4. `dart pub get`
5. `dart format --set-exit-if-changed . && dart analyze && dart test`
6. `dart pub publish --dry-run` — must report no errors.
7. `dart pub publish`
8. Restore the `dependency_overrides:` block for continued local
   development and commit the restore to `master` (never tag the
   override state).

