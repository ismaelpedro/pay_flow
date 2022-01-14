import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_controller.dart';
import '../../../../infra/dtos/ticket_dto.dart';
import '../../../config/app_text_styles.dart';
import '../../../config/app_translations.dart';
import 'custom_appbar_widget.dart';
import 'ticket_card_widget.dart';

class BodyHomeWidget extends StatelessWidget {
  final appController = Get.find<AppController>();
  BodyHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(
        children: [
          CustomAppBarWidget(
            user: appController.currentUser,
            ticketsCount: appController.tickets.length,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    AppTranslationStrings.myTickets.tr,
                    style: AppTextStyles.titleBoldHeading,
                  ),
                  const SizedBox(height: 16),
                  const Divider(thickness: 2),
                  Expanded(
                    child: Scrollbar(
                      isAlwaysShown: true,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 20,
                        itemBuilder: (_, index) {
                          return TicketCardWidget(
                            ticket: TicketDto(
                              nameDto: index % 2 == 0
                                  ? 'League of Legends'
                                  : 'Conta de Luz',
                              dateDto: DateTime.now().toString(),
                              valueDto: index % 2 == 0 ? 2000 : 35200,
                              codeDto: '',
                              fkUserDto: '',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
