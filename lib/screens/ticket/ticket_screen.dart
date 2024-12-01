import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/ticket_view.dart';
import 'package:ticket_app/base/ultils/all_json.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/screens/ticket/widgets/ticket_position_circle.dart';

import '../../base/wedgets/app_column_text_layout.dart';
import '../../base/wedgets/app_layoutbuilder_widget.dart';

class TicketScreen extends StatefulWidget {
  final bool? isColor;
  const TicketScreen({super.key, this.isColor});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {

  late int ticketIndex = 0;

  @override
  void didChangeDependencies() {
    if(ModalRoute.of(context)!.settings.arguments!=null) {
      var args = ModalRoute
          .of(context)!
          .settings
          .arguments as Map;
      ticketIndex = args['index'];
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: Center(child: Text('Tickets')),

      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            children: [
              //SizedBox(height: 40,),
              //Text('Tickets', style: AppStyles.headLineStyle1,),
              //SizedBox(height: 20,),
              AppTicketTabs(fistTab: 'Upcoming',finalTab: 'Previous',),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(left: 16),
                  child: TicketView(ticket: ticketList[ticketIndex], isColor: true,)),
              SizedBox(height: 0.25,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                color: AppStyles.ticketWhite,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(topText: 'Mphatso', bottomText: 'Passenger', textAlign: CrossAxisAlignment.start,isColor: true, ),
                        AppColumnTextLayout(topText: '5221 364869', bottomText: 'Passport', textAlign: CrossAxisAlignment.end, isColor: true,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    AppLayoutBuilderWidget(randomDivider: 16, width: 6,isColor: false,),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(topText: '5221 364869', bottomText: 'Number of E-ticket', textAlign: CrossAxisAlignment.start,isColor: true, ),
                        AppColumnTextLayout(topText: 'B46859', bottomText: 'Booking code', textAlign: CrossAxisAlignment.end, isColor: true,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    AppLayoutBuilderWidget(randomDivider: 16, width: 6,isColor: false,),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(AppMedia.cardSit, scale: 11,
                                ),
                                Text('*** 2462', style: AppStyles.headLineStyle3,)
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text('Payment method', style: AppStyles.headLineStyle4,)
                          ],
                        ),

                        AppColumnTextLayout(topText: '\$249.99', bottomText: 'Price', textAlign: CrossAxisAlignment.end, isColor: true,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    AppLayoutBuilderWidget(randomDivider: 16, width: 6,isColor: false,),
                   ]
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(vertical: 20),

                decoration: BoxDecoration(
                    color: AppStyles.ticketWhite,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(21),
                    bottomLeft: Radius.circular(21)
                  )
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child:BarcodeWidget(height: 70,
                        drawText: false,
                        data: 'mphatsos45@gmail.com',
                        barcode: Barcode.code128(),
                        color: AppStyles.textColor,
                      width: double.infinity,
                    ) ,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  padding: EdgeInsets.only(left: 16),
                  child: TicketView(ticket: ticketList[ticketIndex],)),
            ],
          ),
          TicketPositionCircle(pos: true,),
          TicketPositionCircle(pos: false,),
        ],
      ),
    );
  }
}
