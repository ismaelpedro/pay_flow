import 'package:flutter/material.dart';
import 'package:pay_flow/src/modules/core/core.dart';

class TicketCardWidget extends StatelessWidget {
  final TicketEntity ticket;

  const TicketCardWidget({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      title: Text(
        ticket.name!,
        style: AppTextStyles.titleListTile,
      ),
      subtitle: Text(
        context.i18n.willExpire(date: ticket.date),
        style: AppTextStyles.captionBody,
      ),
      trailing: Text(
        ticket.value!.toCurrencyBRL(),
        style: AppTextStyles.trailingRegular,
      ),
      onTap: () {},
    );
  }
}
