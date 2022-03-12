import 'package:get/get.dart';
import 'package:pay_flow/modules/login/presenter/login_binding.dart';
import 'package:pay_flow/modules/login/presenter/login_page.dart';

import '../../../modules/home/presenter/home_binding.dart';
import '../../../modules/home/presenter/pages/home_page.dart';
import '../../../modules/ticket_form/presenter/ticket_form_binding.dart';
import '../../../modules/ticket_form/presenter/ticket_form_page.dart';

class Routes {
  static const login = '/login';
  static const home = '/home';
  static const ticketForm = '/ticket-form';
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
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ticketForm,
      page: () => const TicketFormPage(),
      binding: TicketFormBinding(),
    ),
  ];
}
