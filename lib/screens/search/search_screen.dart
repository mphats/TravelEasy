import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/app_routes.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/screens/search/widgets/app_text_icon.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/screens/search/widgets/find_ticket.dart';
import 'package:ticket_app/screens/search/widgets/ticket_promotion.dart';

import '../../base/wedgets/app_double_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          SizedBox(height: 40,),
          Text('what are \nyou looking for?', style: AppStyles.headLineStyle1.copyWith(fontSize: 34),),
          SizedBox(height: 20,),
          AppTicketTabs(fistTab: 'Airline tickets',finalTab: 'Home',),
          SizedBox(height: 25,),
          AppTextIcon(icon: Icons.flight_takeoff_rounded, text: 'Departure',),
          SizedBox(height: 20,),
          AppTextIcon(icon: Icons.flight_land_rounded, text: 'Arrival',),
          SizedBox(height: 20,),
          FindTicket(),
          SizedBox(height: 40,),
          AppDoubleText(bigText:
          'Upcoming Flights',
            smallText: 'View all',
            func: () => Navigator. pushNamed(context, AppRoutes.allTickets),
          ),
          SizedBox(height: 40,),
          TicketPromotion()
        ],
      ),
    );
  }
}
