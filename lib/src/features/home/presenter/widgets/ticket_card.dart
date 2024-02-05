import 'package:flutter/material.dart';

import '../../../../core/domain/entities/ticket_entity.dart';
import '../../../../core/presenter/extensions/extensions.dart';
import '../../../../core/presenter/ui/theme/app_text_styles.dart';

class TicketCardWidget extends StatelessWidget {
  final TicketEntity ticket;

  const TicketCardWidget({
    super.key,
    required this.ticket,
  });

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
      subtitle: const Text(
        '',
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
