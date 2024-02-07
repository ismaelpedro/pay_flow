import 'package:flutter/material.dart';

import '../../../../core/presenter/extensions/extensions.dart';
import '../widgets/body_home.dart';
import 'profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final List<Widget> tabs = <Widget>[
    const BodyHome(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          backgroundColor: context.theme.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: const Icon(
            Icons.add_box_outlined,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int value) => setState(() => currentIndex = value),
        height: 60,
        destinations: const <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: NavigationDestination(
              label: '',
              icon: Icon(Icons.home),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: NavigationDestination(
              label: '',
              icon: Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }
}
