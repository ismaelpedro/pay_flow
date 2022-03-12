import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';
import '../widgets/body_home_widget.dart';
import '../widgets/skeleton_home_widget.dart';

class MyTicketsPage extends GetView<HomeController> {
  const MyTicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return IgnorePointer(
        ignoring: controller.isLoading.value,
        child: Scaffold(
          body: controller.isLoading.value
              ? const SkeletonHomeWidget()
              : BodyHomeWidget(),
        ),
      );
    });
  }
}
