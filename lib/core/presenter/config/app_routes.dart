import '../../../modules/login/presenter/login_page.dart';

import '../../../modules/home/presenter/pages/home_page.dart';
import '../../../modules/ticket_form/presenter/ticket_form_page.dart';

class AppRoutes {
  AppRoutes._();

  static final pages = {
    Routes.login: (_) => const LoginPage(),
    Routes.home: (_) => HomePage(),
    Routes.ticketForm: (_) => const TicketFormPage(),
  };
}

class Routes {
  Routes._();

  static const login = '/login';
  static const home = '/home';
  static const ticketForm = '/ticket-form';
}
