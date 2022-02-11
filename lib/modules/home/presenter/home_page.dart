import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/presenter/config/app_colors.dart';
import 'home_controller.dart';
import 'widgets/body_home_widget.dart';
import 'widgets/question_widget.dart';
import 'widgets/skeleton_home_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return IgnorePointer(
        ignoring: controller.isLoading,
        child: Scaffold(
          body: controller.isLoading
              ? const SkeletonHomeWidget()
              : BodyHomeWidget(),
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
              elevation: 0,
              backgroundColor: Colors.white,
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
