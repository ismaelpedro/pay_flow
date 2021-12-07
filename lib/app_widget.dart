import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_injection.dart';
import 'presenter/config/app_routes.dart';
import 'presenter/config/app_translations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      locale: const Locale('pt', 'BR'),
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      initialBinding: AppInjection(),
      initialRoute: Routes.login,
      getPages: AppRoutes.pages,
    );
  }
}
