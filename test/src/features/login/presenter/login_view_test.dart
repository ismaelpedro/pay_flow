import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay_flow/pay_flow_app.dart';
import 'package:pay_flow/src/core/infrastructure/service_locator/service_locator.dart';
import 'package:pay_flow/src/core/presenter/ui/widgets/translation_dropdown_widget.dart';
import 'package:pay_flow/src/features/login/presenter/login_view.dart';

void main() {
  final faker = Faker();
  setUpAll(() => configureDependencies());

  Future<void> setupPayFlowApp(WidgetTester tester) async {
    await tester.pumpWidget(const PayFlowApp());
    var dropdownFinder = find.byType(TranslationDropdownWidget);
    expect(find.text('English'), findsOneWidget);
    await tester.tap(dropdownFinder);
    await tester.pumpAndSettle();
  }

  Widget createTestableWidget(Widget child) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt'),
        Locale('en'),
        Locale('es'),
      ],
      home: child,
    );
  }

  testWidgets('Login screen is displayed correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestableWidget(const LoginView()));
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Forgot your password?'), findsOneWidget);
    expect(find.text('or sign in with'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
    expect(find.byType(TranslationDropdownWidget), findsOneWidget);
    expect(find.byType(InkWell), findsNWidgets(7));
    expect(find.byType(Image), findsWidgets);
  });

  testWidgets('Text fields accept input', (WidgetTester tester) async {
    final email = faker.internet.email();
    final password = faker.internet.password();

    await tester.pumpWidget(createTestableWidget(const LoginView()));
    await tester.enterText(find.byType(TextFormField).first, email);
    await tester.enterText(find.byType(TextFormField).last, password);
    expect(find.text(email), findsOneWidget);
    expect(find.text(password), findsOneWidget);
  });

  testWidgets('Password visibility toggle works', (WidgetTester tester) async {
    await tester.pumpWidget(createTestableWidget(const LoginView()));
    var passwordField = find.byType(TextFormField).last;

    await tester.tap(find.byIcon(Icons.visibility_outlined));
    await tester.pump();
    var textField = tester.widget<TextField>(
      find.descendant(of: passwordField, matching: find.byType(TextField)),
    );
    expect(textField.obscureText, isFalse);
    await tester.tap(find.byIcon(Icons.visibility_off_outlined));
    await tester.pump();
    textField = tester.widget<TextField>(
      find.descendant(of: passwordField, matching: find.byType(TextField)),
    );
    expect(textField.obscureText, isTrue);
  });

  group(
    'Should change language works correctly',
    () {
      testWidgets('Change English to Spanish', (
        WidgetTester tester,
      ) async {
        await setupPayFlowApp(tester);
        await tester.tap(find.text('Spanish').last);
        await tester.pumpAndSettle();
        expect(find.text('Español'), findsOneWidget);
      });
      testWidgets('Change English to Portuguese', (
        WidgetTester tester,
      ) async {
        await setupPayFlowApp(tester);
        await tester.tap(find.text('Portuguese').last);
        await tester.pumpAndSettle();
        expect(find.text('Português'), findsOneWidget);
      });
    },
  );
}
