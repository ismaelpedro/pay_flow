import 'package:flutter/material.dart';

import '../../../features/home/presenter/pages/home_page.dart';
import '../../../features/login/presenter/login_page.dart';
import '../../../features/ticket_form/presenter/ticket_form_page.dart';
import '../../core.dart';

abstract class Routes {
  static const String login = '/login';
  static const String home = '/home';
  static const String ticketForm = '/ticket-form';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
      case Routes.login:
        return MaterialPageRoute<dynamic>(builder: (_) => const LoginPage());
      case Routes.ticketForm:
        return MaterialPageRoute<dynamic>(
          builder: (_) => TicketFormPage(
            ticket: settings.arguments as TicketEntity,
          ),
        );
      default:
        return null;
    }
  }
}
