import 'package:flutter/material.dart';

class MyTicketsPage extends StatefulWidget {
  const MyTicketsPage({Key? key}) : super(key: key);

  @override
  State<MyTicketsPage> createState() => _MyTicketsPageState();
}

class _MyTicketsPageState extends State<MyTicketsPage> {
  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(
      child: Scaffold(
          // body: controller.isLoading
          //     ? const SkeletonHomeWidget()
          //     : const BodyHomeWidget(),
          ),
    );
  }
}
