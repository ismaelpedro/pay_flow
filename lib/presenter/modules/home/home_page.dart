import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_flow/presenter/modules/home/widgets/body_home_widget.dart';
import 'package:pay_flow/presenter/modules/home/widgets/skeleton_home_widget.dart';

import '../../config/app_colors.dart';
import '../../config/app_routes.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Container(
          child: controller.isLoading
              ? const SkeletonHomeWidget()
              : const BodyHomeWidget(),
        );
      }),
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
