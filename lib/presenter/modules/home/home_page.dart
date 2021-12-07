import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../infra/dtos/ticket_dto.dart';
import '../../config/app_colors.dart';
import '../../config/app_routes.dart';
import '../../config/app_text_styles.dart';
import '../../config/app_translations.dart';
import 'home_controller.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/ticket_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserEntity user = Get.arguments;
    const listSize = 20;

    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            CustomAppBar(user: user, ticketsCount: listSize),
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
                        child: StreamBuilder(
                          stream: null,
                          initialData: const [],
                          builder: (context, snapshot) {
                            return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: listSize,
                              itemBuilder: (_, index) {
                                return TicketCard(
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(
          Icons.add_box_outlined,
          color: Colors.white,
        ),
        onPressed: () {
          Get.toNamed(Routes.barcodeScan);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            label: '',
            tooltip: '',
            icon: Icon(Icons.house),
          ),
          BottomNavigationBarItem(
            label: '',
            tooltip: '',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
