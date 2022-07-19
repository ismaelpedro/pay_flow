import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/presenter/navigation/routes.dart';
import '../../../../core/presenter/theme/app_colors.dart';
import '../home_controller.dart';
import 'my_tickets_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tabs = [
    const MyTicketsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<HomeController>();

    return Scaffold(
      body: tabs[controller.currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(
          Icons.add_box_outlined,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routes.ticketForm,
          );
        },
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
    );
  }
}
