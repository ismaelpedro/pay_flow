import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'navigation/routes.dart';
import 'ui/theme/app_colors.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class PayFlowApp extends StatefulWidget {
  const PayFlowApp({Key? key}) : super(key: key);

  @override
  State<PayFlowApp> createState() => _PayFlowAppState();
}

class _PayFlowAppState extends State<PayFlowApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, _) {
        return MaterialApp(
          locale: const Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.orange),
            scaffoldBackgroundColor: Colors.white,
          ),
          initialRoute: Routes.login,
          navigatorKey: navigatorKey,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
