import 'package:get/get.dart';
import 'package:pay_flow/presenter/modules/home/presenter/home_binding.dart';
import 'package:pay_flow/presenter/modules/home/presenter/home_page.dart';
import 'package:pay_flow/presenter/modules/login/presenter/login_binding.dart';
import 'package:pay_flow/presenter/modules/login/presenter/login_page.dart';

class Routes {
  static const login = '/login';
  static const home = '/home';
  static const barcodeScan = '/barcode_scan';
  static const registrationBankSplip = '/registration_bank_splip';
}

class AppRoutes {
  static final pages = [
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
