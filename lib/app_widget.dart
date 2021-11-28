import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_flow/core/app_translations.dart';
import 'core/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      translations: AppTranslations(),
      initialRoute: Routes.login,
      getPages: AppRoutes.pages,
    );
  }
}
