import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_flow/modules/home/presenter/home_controller.dart';
import 'package:pay_flow/modules/home/presenter/widgets/ticket_card_widget.dart';

import '../../../../core/domain/entities/ticket_entity.dart';
import '../../../../core/presenter/app_controller.dart';
import '../../../../core/presenter/config/app_images.dart';
import '../../../../core/presenter/config/app_text_styles.dart';
import '../../../../core/presenter/config/app_translations.dart';
import 'custom_appbar_widget.dart';

class BodyHomeWidget extends GetView<HomeController> {
  BodyHomeWidget({Key? key}) : super(key: key);
  final appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(
        children: [
          CustomAppBarWidget(user: appController.currentUser),
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
                  Obx(() {
                    return Expanded(
                      child: appController.tickets.isEmpty
                          ? Center(child: Image.asset(AppImages.noTickets))
                          : FutureBuilder<List<TicketEntity>>(
                              // future: controller.getTickets(),
                              builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CupertinoActivityIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('${snapshot.error}'),
                                );
                              }
                              return Scrollbar(
                                isAlwaysShown: true,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: appController.tickets.length,
                                  itemBuilder: (_, index) {
                                    final ticket = Get.find<AppController>()
                                        .tickets[index];

                                    return TicketCardWidget(ticket: ticket);
                                  },
                                ),
                              );
                            }),
                    );
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
