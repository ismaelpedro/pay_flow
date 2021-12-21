import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_flow/presenter/modules/home/home_controller.dart';

import '../../../../../infra/dtos/ticket_dto.dart';
import '../../../config/app_text_styles.dart';
import '../../../config/app_translations.dart';

class TicketCard extends StatelessWidget {
  final TicketDto ticket;

  const TicketCard({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return ListTile(
      title: Text(
        ticket.nameDto,
        style: AppTextStyles.titleListTile,
      ),
      subtitle: Text(
          '${AppTranslationStrings.willExpire.tr} ${controller.getDateFormat().format(DateTime.parse(ticket.dateDto))}'),
      trailing: Text(
        controller.getCurrencyFormat().format(ticket.valueDto),
        style: AppTextStyles.trailingRegular,
      ),
      onTap: () {},
    );
  }
}
