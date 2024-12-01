import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/app_routes.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/screens/home/widgets/hotel.dart';

import '../../base/res/media.dart';
import '../../base/ticket_view.dart';
import '../../base/ultils/all_json.dart';
import '../../base/wedgets/app_double_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        children: [
          SizedBox(height: 40,),
         Container(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good morning", style: AppStyles.headLineStyle3
                        ),
                        SizedBox(height: 5,),
                        Text("Book Tickets", style: AppStyles.headLineStyle1
                        ),
                      ],
                   ),
                   Container(

                     width: 50,
                     height: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       image: DecorationImage(
                           image: AssetImage(AppMedia.logo))
                     ),
                   )
                 ],
               ),
               const SizedBox(height:25),

               Container(
                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: const Color(0xFFF4F6FD),
                 ),
                 child: Row(

                   children: [
                     Icon(FluentSystemIcons.ic_fluent_search_regular, color: Color(0xFFBFC205),),
                      Text("search")
                   ],
                 ),
               ),
               const SizedBox(height: 40),
               AppDoubleText(bigText:
               'Upcoming Flights',
                 smallText: 'View all',
               func: () => Navigator. pushNamed(context, AppRoutes.allTickets),
               ),
               const SizedBox(height: 20),
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                   child: Row(
                     children: ticketList.map((singleTicket) =>
                     GestureDetector(
                         onTap: (){
                           var index = ticketList.indexOf(singleTicket);
                           Navigator.pushNamed(context, AppRoutes.ticketScreen, arguments: {
                             'index': index
                           });
                         },

                         child: TicketView(
                             ticket: singleTicket))).
                     toList(),
                   )
               ),
               const SizedBox(height: 40),
               AppDoubleText(
                 bigText: 'Hotels',
                 smallText: 'View all',
               func: () {
                Navigator.pushNamed(context, AppRoutes.allHotels);
               },
               ),
               const SizedBox(height: 20),
               SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Row(
                     children: hotelList.map((singleHotel) =>
                         GestureDetector(
                             onTap: (){
                               var index = hotelList.indexOf(singleHotel);
                               Navigator.pushNamed(context, AppRoutes.hotelDetail, arguments: {
                                 'index': index
                               });
                             },
                             child: Hotel(hotels: singleHotel))).toList(),
                   )
               ),

             ],
           ),
         ),

        ],
      ),
    );
  }
}
