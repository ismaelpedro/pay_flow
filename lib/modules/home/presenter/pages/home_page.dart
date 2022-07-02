import 'package:flutter/material.dart';
import 'profile_page.dart';

import '../../../../core/presenter/configs/app_colors.dart';
import 'my_tickets_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final tabs = [
    const MyTicketsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      // ignoring: isLoading.value,
      child: Scaffold(
        // body: tabs[controller.currentIndex.value],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.orange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: const Icon(
            Icons.add_box_outlined,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        bottomNavigationBar: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            onTap: (index) {},
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
  }
}
