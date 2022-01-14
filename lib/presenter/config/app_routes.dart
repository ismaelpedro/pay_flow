import 'package:get/get.dart';
import 'package:pay_flow/presenter/modules/ticket_form/ticket_form_binding.dart';
import 'package:pay_flow/presenter/modules/ticket_form/ticket_form_page.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_page.dart';

class Routes {
  static const login = '/login';
  static const home = '/home';
  static const ticketForm = '/ticketForm';
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
      name: Routes.ticketForm,
      page: () => const TicketFormPage(),
      binding: TicketFormBinding(),
    ),
  ];
}
