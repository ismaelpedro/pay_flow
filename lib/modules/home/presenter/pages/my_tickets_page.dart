import 'package:flutter/material.dart';

import '../widgets/skeleton_home_widget.dart';

class MyTicketsPage extends StatelessWidget {
  const MyTicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(
      child: Scaffold(
        body: SkeletonHomeWidget(),
      ),
    );
  }
}
