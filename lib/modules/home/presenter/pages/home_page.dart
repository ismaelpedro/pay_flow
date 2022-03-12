import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_flow/modules/home/presenter/pages/profile_page.dart';

import '../../../../core/presenter/config/app_colors.dart';
import '../home_controller.dart';
import '../widgets/question_widget.dart';
import 'my_tickets_page.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final tabs = [
    const MyTicketsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return IgnorePointer(
        ignoring: controller.isLoading.value,
        child: Scaffold(
          body: tabs[controller.currentIndex.value],
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.orange,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: const Icon(
              Icons.add_box_outlined,
              color: Colors.white,
            ),
            onPressed: () => Get.dialog(const QuestionWidget()),
          ),
          bottomNavigationBar: SizedBox(
            height: 70,
            child: BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              elevation: 0,
              backgroundColor: Colors.white,
              onTap: (index) {
                controller.currentIndex.value = index;
              },
              items: const [
                BottomNavigationBarItem(
                  label: '',
                  icon: Icon(Icons.house),
                ),
                BottomNavigationBarItem(
                  label: '',
                  icon: Icon(Icons.person),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
