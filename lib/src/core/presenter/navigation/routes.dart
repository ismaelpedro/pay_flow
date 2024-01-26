import 'package:flutter/material.dart';

import '../../../features/login/presenter/login_view.dart';
import '../../../features/ticket_form/presenter/ticket_form_page.dart';
import '../../domain/entities/ticket_entity.dart';

abstract class Routes {
  static const String login = '/login';
  static const String home = '/home';
  static const String ticketForm = '/ticket-form';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute<dynamic>(builder: (_) => const LoginView());
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
