import '../../../modules/home/presenter/pages/home_page.dart';
import '../../../modules/login/presenter/login_page.dart';
import '../../../modules/ticket_form/presenter/ticket_form_page.dart';
import 'routes.dart';

abstract class Pages {
  static final pages = {
    Routes.login: (_) => const LoginPage(),
    Routes.home: (_) => const HomePage(),
    Routes.ticketForm: (_) => const TicketFormPage(),
  };
}