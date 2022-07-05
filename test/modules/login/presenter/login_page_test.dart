import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pay_flow/core/presenter/presenter.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Should change language', () {
    setUp(() {
      GetIt.I.registerLazySingleton(() => AppController());
    });

    testWidgets(
      'Should change language to portuguese',
      (tester) async {
        await tester.pumpWidget(const PayFlowApp());
        await tester.pumpAndSettle();

        expect(
          find.byKey(
            const ValueKey('pt-option'),
          ),
          findsOneWidget,
        );
      },
    );

    // testWidgets(
    //   'Should change language to english',
    //   (tester) async {},
    // );
    // testWidgets(
    //   'Should change language to spanish',
    //   (tester) async {},
    // );
  });
}
