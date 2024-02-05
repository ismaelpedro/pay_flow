import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:upgrader/upgrader.dart';

import 'src/core/infrastructure/auth/auth_service.dart';
import 'src/core/infrastructure/service_locator/service_locator.dart';
import 'src/core/presenter/navigation/routes.dart';
import 'src/core/presenter/ui/theme/app_colors.dart';
import 'src/features/home/presenter/views/home_view.dart';
import 'src/features/login/presenter/login_view.dart';
import 'src/features/ticket_form/presenter/ticket_form_view.dart';

var navigatorKey = GlobalKey<NavigatorState>();

class PayFlowApp extends StatefulWidget {
  const PayFlowApp({super.key});

  @override
  State<PayFlowApp> createState() => PayFlowAppState();
}

class PayFlowAppState extends State<PayFlowApp> {
  Locale? appLocale;
  late AuthService authService;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    authService = locator.get<AuthService>();
    super.initState();
  }

  void setLocale(Locale newLocale) {
    if (!mounted) return;
    setState(() => appLocale = newLocale);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: appLocale ?? (kDebugMode ? DevicePreview.locale(context) : null),
      navigatorKey: navigatorKey,
      builder: (context, child) {
        return UpgradeAlert(
          upgrader: Upgrader(
            debugDisplayAlways: kDebugMode,
            languageCode: appLocale?.languageCode ?? 'en',
          ),
          showLater: false,
          showIgnore: false,
          canDismissDialog: kDebugMode,
          navigatorKey: navigatorKey,
          child: child,
        );
      },
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
        primaryColor: AppColors.orange,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.orange),
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.orange),
          ),
        ),
      ),
      initialRoute: Routes.login,
      routes: {
        Routes.login: (_) => const LoginView(),
        Routes.ticketForm: (_) => const TicketFormView(),
        Routes.home: (_) => const HomeView(),
      },
    );
  }
}
