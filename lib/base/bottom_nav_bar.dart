import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ticket_app/controller/bottom_nav_controller.dart';
import 'package:ticket_app/screens/profile/profile.dart';
import 'package:ticket_app/screens/search/search_screen.dart';
import 'package:ticket_app/screens/ticket/ticket_screen.dart';

import '../screens/home/home_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  final appScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {

    return Obx((){
      return Scaffold(

        body: appScreens[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.onItemTapped,
            selectedItemColor: Colors.blueGrey,
            unselectedItemColor: const Color(0xFF526400),
            showSelectedLabels: false,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket), label: "Tickets"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ]),
      );
    });
  }
}
