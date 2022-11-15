import 'package:flutter/material.dart';

import '../../../core/infrastructure/service_locator/service_locator.dart';
import '../home_controller.dart';
import '../widgets/body_home_widget.dart';
import '../widgets/skeleton_home_widget.dart';

class MyTicketsPage extends StatefulWidget {
  const MyTicketsPage({Key? key}) : super(key: key);

  @override
  State<MyTicketsPage> createState() => _MyTicketsPageState();
}

class _MyTicketsPageState extends State<MyTicketsPage> {
  HomeController controller = serviceLocator.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Scaffold(
        body: controller.isLoading
            ? const SkeletonHomeWidget()
            : const BodyHomeWidget(),
      ),
    );
  }
}
