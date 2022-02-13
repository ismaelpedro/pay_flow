import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app_injection.dart';
import 'config/app_routes.dart';
import 'config/app_translations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

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
