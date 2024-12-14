import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_app/provider/bottom_nav_provider.dart';
import 'package:ticket_app/screens/profile/profile.dart';
import 'package:ticket_app/screens/search/search_screen.dart';
import 'package:ticket_app/screens/ticket/ticket_screen.dart';

import '../screens/home/home_screen.dart';

class BottomNavBar extends ConsumerWidget {
  BottomNavBar({super.key});

  final appScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      var selectedIndex = ref.watch(bottomNavBarNotifierProvider);
      return Scaffold(

        body: appScreens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: ref.watch(bottomNavBarNotifierProvider.notifier).onItemTapped,
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

  }
}
