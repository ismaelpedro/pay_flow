import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_injection.dart';
import 'presenter/config/app_routes.dart';
import 'presenter/config/app_translations.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
      ),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      initialBinding: AppInjection(),
      initialRoute: Routes.login,
      getPages: AppRoutes.pages,
    );
  }
}
