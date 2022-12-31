import 'package:flutter/material.dart';

import '../../../core/infrastructure/service_locator/service_locator.dart';
import '../home_store.dart';
import '../widgets/body_home_widget.dart';
import '../widgets/skeleton_home_widget.dart';

class MyTicketsPage extends StatefulWidget {
  const MyTicketsPage({Key? key}) : super(key: key);

  @override
  State<MyTicketsPage> createState() => _MyTicketsPageState();
}

class _MyTicketsPageState extends State<MyTicketsPage> {
  late HomeStore _homeStore;

  @override
  void initState() {
    _homeStore = serviceLocator.get<HomeStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Scaffold(
        body: _homeStore.isLoading
            ? const SkeletonHomeWidget()
            : const BodyHomeWidget(),
      ),
    );
  }
}
