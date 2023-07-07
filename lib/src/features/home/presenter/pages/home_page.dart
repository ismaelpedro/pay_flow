import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_flow/src/core/core.dart';
import 'package:pay_flow/src/features/home/presenter/widgets/body_home_widget.dart';

import '../../../../core/infrastructure/service_locator/service_locator.dart';
import '../home_store.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStore _homeStore;

  final List<Widget> tabs = <Widget>[
    const BodyHomeWidget(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    _homeStore = serviceLocator.get<HomeStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => tabs[_homeStore.currentIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(
          Icons.add_box_outlined,
          color: Colors.white,
        ),
        onPressed: () async => await _homeStore.scanBarCode(),
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return NavigationBar(
            selectedIndex: _homeStore.currentIndex,
            onDestinationSelected: (int value) {
              _homeStore.setIndex(value);
            },
            height: 80.h,
            destinations: const <Widget>[
              NavigationDestination(
                label: '',
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Icon(
                    Icons.home,
                  ),
                ),
              ),
              NavigationDestination(
                label: '',
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Icon(
                    Icons.person,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
