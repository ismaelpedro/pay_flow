import 'package:get/get.dart';

import '../modules/barcode_scanner/barcode_scanner_binding.dart';
import '../modules/barcode_scanner/barcode_scanner_page.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_page.dart';

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
    GetPage(
      name: Routes.barcodeScan,
      page: () => const BarcodeScannerPage(),
      binding: BarcodeScannerBinding(),
    ),
  ];
}
