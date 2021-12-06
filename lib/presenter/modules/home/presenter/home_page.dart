import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_flow/infra/dtos/ticket_dto.dart';
import 'package:pay_flow/presenter/config/app_colors.dart';
import 'package:pay_flow/presenter/widgets/translation_dropdown_widget.dart';

import '../../../../infra/dtos/user_dto.dart';
import '../../../config/app_text_styles.dart';
import '../../../config/app_translations.dart';
import 'home_controller.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/ticket_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  // Future<void> waiting() async {
  //   await Future.delayed(const Duration(seconds: 2));
  // }

  @override
  Widget build(BuildContext context) {
    final UserDto user = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            CustomAppBar(user: user),
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
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            TicketCard(
                              ticket: TicketDto(
                                idDto: '',
                                codeDto: '',
                                titleDto: 'Conta de água',
                                dateDto: '11/03/2021',
                                valueDto: '10,00',
                                fkUserDto: '',
                              ),
                            ),
                            TicketCard(
                              ticket: TicketDto(
                                idDto: '',
                                codeDto: '',
                                titleDto: 'League of Legends',
                                dateDto: '11/03/2021',
                                valueDto: '99,98',
                                fkUserDto: '',
                              ),
                            ),
                            TicketCard(
                              ticket: TicketDto(
                                idDto: '',
                                codeDto: '',
                                titleDto: 'Conta de água',
                                dateDto: '11/03/2021',
                                valueDto: '10,00',
                                fkUserDto: '',
                              ),
                            ),
                            TicketCard(
                              ticket: TicketDto(
                                idDto: '',
                                codeDto: '',
                                titleDto: 'League of Legends',
                                dateDto: '11/03/2021',
                                valueDto: '99,98',
                                fkUserDto: '',
                              ),
                            ),
                            TicketCard(
                              ticket: TicketDto(
                                idDto: '',
                                codeDto: '',
                                titleDto: 'Conta de água',
                                dateDto: '11/03/2021',
                                valueDto: '10,00',
                                fkUserDto: '',
                              ),
                            ),
                            TicketCard(
                              ticket: TicketDto(
                                idDto: '',
                                codeDto: '',
                                titleDto: 'League of Legends',
                                dateDto: '11/03/2021',
                                valueDto: '99,98',
                                fkUserDto: '',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(
          Icons.add_box_outlined,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.house),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.document_scanner_outlined),
              tooltip: '',
            ),
          ],
        ),
      ),

      // body: Column(
      //   children: [
      //     FutureBuilder(
      //       future: waiting(),
      //       builder: (context, snapshot) {
      //         if (snapshot.connectionState == ConnectionState.waiting) {
      //           return const SkeletonHomeWidget();
      //         }
      //         return CustomAppBar(user: user);
      //       },
      //     )
      //   ],
      // ),
    );
  }
}
