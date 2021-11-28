import 'package:get/get.dart';

import '../modules/home/presenter/home_binding.dart';
import '../modules/home/presenter/home_page.dart';
import '../modules/login/presenter/login_binding.dart';
import '../modules/login/presenter/login_page.dart';

class Routes {
  static const login = '/login';
  static const home = '/home';
  static const barcodeScan = '/barcodeScan';
  static const registrationBankSplip = '/registrationBankSplip';
}

class AppRoutes {
  static final pages = [
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding()
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding()
    ),
  ];
}
