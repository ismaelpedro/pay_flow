import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../home_controller.dart';
import '../widgets/body_home_widget.dart';
import '../widgets/skeleton_home_widget.dart';

class MyTicketsPage extends StatefulWidget {
  const MyTicketsPage({Key? key}) : super(key: key);

  @override
  State<MyTicketsPage> createState() => _MyTicketsPageState();
}

class _MyTicketsPageState extends State<MyTicketsPage> {
  final controller = GetIt.I.get<HomeController>();

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
