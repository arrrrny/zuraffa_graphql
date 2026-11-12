import 'dart:async';

import 'package:graphql_plus/graphql_plus.dart';
import 'package:test/test.dart';

/// Regression guard for the `QueryManager` double-completion this package's
/// `graphql_plus` dependency exists to fix (zuraffa_vendure #4/#8).
///
/// `Stream.timeout` forwards a `TimeoutException` to `onError` without
/// cancelling the source subscription, so a response that arrives *after* the
/// timeout has already settled the query is still delivered. Stock
/// `graphql` 5.2.4 completed the completer from `onData` unguarded, which
/// threw `Bad state: Future already completed` from inside that async
/// callback and took the app down. The fork guards the completer and cancels
/// the subscription, so the late response must be a no-op and the client must
/// stay usable.
void main() {
  group('QueryManager timeout regression (graphql_plus)', () {
    const document = 'query GetProduct { product { id name } }';

    GraphQLClient buildClient({
      required Duration responseDelay,
      Duration? queryRequestTimeout,
    }) {
      return GraphQLClient(
        link: Link.function((request, [forward]) async* {
          await Future<void>.delayed(responseDelay);
          yield Response(
            data: const {
              'product': {'id': '1', 'name': 'Widget'},
            },
            response: const {
              'data': {
                'product': {'id': '1', 'name': 'Widget'},
              },
            },
          );
        }),
        cache: GraphQLCache(),
        queryRequestTimeout: queryRequestTimeout,
      );
    }

    test(
      'a response arriving after the timeout is a no-op, not a crash',
      () async {
        final client = buildClient(
          responseDelay: const Duration(milliseconds: 200),
          queryRequestTimeout: const Duration(milliseconds: 20),
        );

        final result = await client.query(
          QueryOptions(
            document: gql(document),
            fetchPolicy: FetchPolicy.noCache,
          ),
        );

        // The query reports the timeout...
        expect(result.hasException, isTrue);
        expect(result.exception.toString(), contains('TimeoutException'));

        // ...and the late response is swallowed instead of completing the
        // already-settled future ("Bad state: Future already completed").
        await Future<void>.delayed(const Duration(milliseconds: 400));
      },
    );

    test('the client still answers queries after a timeout', () async {
      final slow = buildClient(
        responseDelay: const Duration(milliseconds: 200),
        queryRequestTimeout: const Duration(milliseconds: 20),
      );

      final timedOut = await slow.query(
        QueryOptions(document: gql(document), fetchPolicy: FetchPolicy.noCache),
      );
      expect(timedOut.hasException, isTrue);

      final fast = buildClient(
        responseDelay: Duration.zero,
        queryRequestTimeout: const Duration(seconds: 5),
      );

      final ok = await fast.query(
        QueryOptions(document: gql(document), fetchPolicy: FetchPolicy.noCache),
      );

      expect(ok.hasException, isFalse);
      expect(ok.data?['product'], isA<Map<String, dynamic>>());
    });
  });
}
