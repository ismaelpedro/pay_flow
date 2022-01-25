import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_flow/domain/entities/ticket_entity.dart';

import '../../../config/app_text_styles.dart';
import '../../../config/app_translations.dart';
import '../home_controller.dart';

class TicketCardWidget extends StatelessWidget {
  final TicketEntity ticket;

  const TicketCardWidget({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return ListTile(
      title: Text(
        ticket.name,
        style: AppTextStyles.titleListTile,
      ),
      subtitle: Text(
          '${AppTranslationStrings.willExpire.tr} ${controller.getDateFormat().format(DateTime.parse(ticket.date))}'),
      trailing: Text(
        controller.getCurrencyFormat().format(ticket.value),
        style: AppTextStyles.trailingRegular,
      ),
      onTap: () {},
    );
  }
}
