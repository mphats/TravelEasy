import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ticket_app/base/bottom_nav_bar.dart';
import 'package:ticket_app/base/res/app_routes.dart';
import 'package:ticket_app/block/text_expansion_blocks.dart';
import 'package:ticket_app/screens/home/all_hotels.dart';
import 'package:ticket_app/screens/home/all_tickets.dart';
import 'package:ticket_app/screens/hotel_detail.dart';
import 'package:ticket_app/screens/profile/profile.dart';
import 'package:ticket_app/screens/ticket/ticket_screen.dart';
void main() {
  runApp(
     ProviderScope(child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => TextExpansionBlocs()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {

            AppRoutes.homePage:(context)=> BottomNavBar(),
            AppRoutes.allTickets:(context) => const AllTickets(),
            AppRoutes.ticketScreen:(context) => const TicketScreen(),
            AppRoutes.allHotels:(context) => const AllHotels(),
            AppRoutes.hotelDetail: (context) => const HotelDetail(),
            AppRoutes.profile: (context) => const Profile()
          },
        ));
  }
}

