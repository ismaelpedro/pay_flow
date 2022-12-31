import 'package:flutter/material.dart';

import '../../../core/infrastructure/service_locator/service_locator.dart';
import '../../../core/presenter/navigation/routes.dart';
import '../../../core/presenter/theme/app_colors.dart';
import '../home_controller.dart';
import 'my_tickets_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> tabs = <Widget>[
    const MyTicketsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    HomeController controller = serviceLocator.get<HomeController>();

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
        height: 100,
        child: NavigationBar(
          destinations: const <Widget>[
            NavigationDestination(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: Icon(
                  Icons.home,
                ),
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: Icon(
                  Icons.person,
                ),
              ),
              label: '',
            ),
          ],
        ),
        // child: BottomNavigationBar(
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        //   onTap: (int index) {},
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       label: '',
        //       icon: Icon(Icons.home),
        //     ),
        //     BottomNavigationBarItem(
        //       label: '',
        //       icon: Icon(Icons.person),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
