import 'package:flutter/material.dart';

import '../../../../core/domain/entities/ticket_entity.dart';
import '../../../../core/presenter/theme/app_text_styles.dart';

class TicketCardWidget extends StatelessWidget {
  final TicketEntity ticket;

  const TicketCardWidget({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        ticket.name,
        style: AppTextStyles.titleListTile,
      ),
      subtitle: const Text(''),
      trailing: Text(
        // controller.getCurrencyFormat().format(ticket.value),
        ticket.value,
        style: AppTextStyles.trailingRegular,
      ),
      onTap: () {},
    );
  }
}
