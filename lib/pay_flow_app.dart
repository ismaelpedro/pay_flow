import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'src/core/presenter/navigation/routes.dart';
import 'src/core/presenter/ui/theme/app_colors.dart';
import 'src/features/login/presenter/login_view.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class PayFlowApp extends StatefulWidget {
  const PayFlowApp({super.key});

  @override
  State<PayFlowApp> createState() => PayFlowAppState();
}

class PayFlowAppState extends State<PayFlowApp> {
  Locale? appLocale;

  void setLocale(Locale newLocale) {
    if (!mounted) return;
    setState(() {
      appLocale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      locale: appLocale ?? DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.orange),
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.orange),
          ),
        ),
      ),
      routerConfig: GoRouter(
        navigatorKey: navigatorKey,
        initialLocation: Routes.login,
        routes: [
          GoRoute(
            path: Routes.login,
            builder: (context, state) => const LoginView(),
          ),
        ],
      ),
    );
  }
}
