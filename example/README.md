# zuraffa_graphql

GraphQL client factory, subscription streams and a code generator that turns
`.graphql` documents into typed Dart clients for Zuraffa apps.

## Create a client

```dart
import 'package:zuraffa_graphql/zuraffa_graphql.dart';

final client = createGraphQLClient(
  endpoint: 'https://api.example.com/graphql',
);

final result = await client.query(document, variables: {'id': 1});
```

## Generate a typed datasource

```dart
import 'package:zuraffa_graphql/zuraffa_graphql.dart';

final generator = DataSourceGenerator();
await generator.generate(
  schema: schemaText,
  documents: documentTexts,
  output: 'lib/src/data/datasources/',
);
```