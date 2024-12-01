import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/wedgets/app_column_text_layout.dart';
import 'package:ticket_app/base/wedgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/base/wedgets/big_circle.dart';
import 'package:ticket_app/base/wedgets/big_dot.dart';
import 'package:ticket_app/base/wedgets/text_style_fourth.dart';
import 'package:ticket_app/base/wedgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  const TicketView({super.key, required this.ticket, this.wholeScreen = false, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width * 0.85,
        height: 180,
        child: Container(
          margin: EdgeInsets.only(right: wholeScreen == true?0:16),
          child: Column(
            children: [
              //blue part of ticket
              Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: isColor==null?AppStyles.ticketBlue:AppStyles.ticketWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(21),
                          topRight: Radius.circular(21))),
                  child: Column(
                    children: [
                      //chow departure and destination with icons first line
                      Row(
                        children: [
                          TextStyleThird(text: ticket['form']['code'], isColor: isColor,),
                          Expanded(child: Container()),
                          BigDot(isColor: isColor,),
                          Expanded(
                              child: Stack(
                            children: [
                              SizedBox(
                                height: 24,
                                child: AppLayoutBuilderWidget(randomDivider: 6),
                              ),
                              Center(
                                child: Transform.rotate(
                                    angle: 1.57,
                                    child: Icon(
                                      Icons.local_airport_rounded,
                                      color: isColor==null?Colors.white: AppStyles.planeSecondColor,
                                    )),
                              )
                            ],
                          )),
                          BigDot(isColor: isColor),
                          Expanded(child: Container()),
                          TextStyleThird(text: ticket['to']['code'], isColor: isColor,),
                        ],
                      ),
                      SizedBox(height: 3),
                      //chow departure and destination names with time
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child:TextStyleFourth(text: ticket['form']['name'], isColor: isColor,),
                          ),
                          Expanded(child: Container()),
                          TextStyleFourth(text: ticket['flying_time'],isColor: isColor,),
                          Expanded(child: Container()),
                          SizedBox(
                            width: 100,
                            child: TextStyleFourth(text: ticket['to']['name'], align: TextAlign.end,isColor: isColor,),
                          ),
                        ],
                      )
                    ],
                  )),
              //circles and dots
              Container(
                color:isColor==null? AppStyles.ticketRed:AppStyles.ticketWhite,
                      //chow departure and destination with icons first line
                      child: Row(
                        children: [
                          BigCircle(isRight: false,isColor: isColor,),
                          Expanded(child: AppLayoutBuilderWidget(randomDivider: 16, width: 6,isColor: isColor,)),
                          BigCircle(isRight: true,isColor: isColor,)
                        ],
                      ),

                  ),
              //orange part of the ticket
              Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: isColor==null?AppStyles.ticketRed:AppStyles.ticketWhite,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(isColor==null?21:0),
                          bottomRight: Radius.circular(isColor==null?21:0))),
                  child: Column(
                    children: [
                      //chow departure and destination with icons first line
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppColumnTextLayout(topText: ticket['date'], bottomText: 'Date', textAlign: CrossAxisAlignment.start,isColor: isColor, ),
                          AppColumnTextLayout(topText: ticket['departure_time'], bottomText: 'Departure time', textAlign: CrossAxisAlignment.center, isColor: isColor,),
                          AppColumnTextLayout(topText: ticket['number'].toString(), bottomText: 'Number', textAlign: CrossAxisAlignment.end, isColor: isColor,),

                        ],
                      ),

                    ],
                  )),
            ],
          ),
        ));
  }
}
