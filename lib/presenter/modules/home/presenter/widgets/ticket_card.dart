import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../infra/dtos/ticket_dto.dart';
import '../../../../config/app_text_styles.dart';
import '../../../../config/app_translations.dart';

class TicketCard extends StatelessWidget {
  final TicketDto ticket;

  const TicketCard({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        ticket.titleDto,
        style: AppTextStyles.titleListTile,
      ),
      subtitle:
          Text('${AppTranslationStrings.willExpire.tr} ${ticket.dateDto}'),
      trailing: Text(
        '${AppTranslationStrings.money.tr} ${ticket.valueDto}',
        style: AppTextStyles.trailingRegular,
      ),
    );
  }
}
