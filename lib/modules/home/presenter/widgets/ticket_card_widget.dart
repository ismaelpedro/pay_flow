import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/domain/entities/ticket_entity.dart';
import '../../../../core/presenter/config/app_text_styles.dart';
import '../../../../core/presenter/config/app_translations.dart';
import '../home_controller.dart';

class TicketCardWidget extends GetView<HomeController> {
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
      subtitle: Text(
        // '${AppTranslationStrings.willExpire.tr} ${controller.getDateFormat().format(DateTime.parse(ticket.date))}',
        '${AppTranslationStrings.willExpire.tr} ${ticket.date}',
      ),
      trailing: Text(
        // controller.getCurrencyFormat().format(ticket.value),
        ticket.value,
        style: AppTextStyles.trailingRegular,
      ),
      onTap: () {},
    );
  }
}
