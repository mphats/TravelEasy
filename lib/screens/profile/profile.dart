import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/wedgets/app_column_text_layout.dart';
import 'package:ticket_app/base/wedgets/heading_text.dart';
import 'package:ticket_app/base/wedgets/text_style_fourth.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            Padding(padding: EdgeInsets.only(top: 40)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 86,
                  height: 86,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(
                            AppMedia.logo
                        )
                    )
                  ),
                ),
                SizedBox(width: 10,),
                //column text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingText(text: 'Book Tickets', isColor: false),
                    Text('Blantyre', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey.shade500),
                    ),
                    SizedBox(height: 8,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 3,vertical: 3),
                      //decoration
                      decoration: BoxDecoration(
                        color: AppStyles.profileLocationColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      //child ->row -> icon, text
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppStyles.profileTextColor
                            ),
                            child: const Icon(FluentSystemIcons.ic_fluent_shield_filled,
                            color: Colors.white, size: 15,),
                          ),
                          SizedBox(width: 5,),
                          Text('Premium status', style: TextStyle(
                            color: AppStyles.profileTextColor, fontWeight: FontWeight.w500
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(child: Container()),
                Text('Edit', style: TextStyle(
                  color: AppStyles.primaryColor, fontWeight:  FontWeight.w300
                ),
                )
              ],
            ),
            SizedBox(height: 8,),
            //divider
            Divider(color: Colors.grey.shade300,),
            Stack(
              children: [
                Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppStyles.primaryColor,
                    borderRadius: BorderRadius.circular(18)
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.white,
                        child: Icon(
                          FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                          color: AppStyles.primaryColor,
                          size: 25,
                        ),
                      ),
                      SizedBox(width: 25,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextStyleFourth(
                            text: 'You\'v got a new award', isColor: null,),
                          Text(
                            'You have 95 flights in a year',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.5)
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: -40,
                    right: -45,
                    child: Container(
                      padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 18, color: Color(0xFF264CD2))
                  ),
                ))
              ],
            ),
            SizedBox(height: 25,),
            Text('Accumulated miles',style: AppStyles.headLineStyle2.copyWith(fontSize: 18)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppStyles.bgColor
              ),
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Text('192802', style: TextStyle(
                    fontSize: 45,color: AppStyles.textColor, fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Miles accrued',style: AppStyles.headLineStyle4,),
                      Text('16th July',style: AppStyles.headLineStyle4,),
                    ],
                  ),
                  SizedBox(height: 4,),
                  Divider(color: Colors.grey.shade300,),
                  SizedBox(height: 4,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(topText: '23 042', bottomText: 'Miles', textAlign: CrossAxisAlignment.start, isColor: false,),
                      AppColumnTextLayout(topText: 'Airline BT', bottomText: 'Received from', textAlign: CrossAxisAlignment.end, isColor: false,),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(topText: '24', bottomText: 'Miles', textAlign: CrossAxisAlignment.start, isColor: false,),
                      AppColumnTextLayout(topText: 'Sokotech', bottomText: 'Received from', textAlign: CrossAxisAlignment.end, isColor: false,),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(topText: '52 340', bottomText: 'Miles', textAlign: CrossAxisAlignment.start, isColor: false,),
                      AppColumnTextLayout(topText: 'DBeskal', bottomText: 'Received from', textAlign: CrossAxisAlignment.end, isColor: false,),
                    ],
                  )
                ],
              ),
            ),

          ],
      ),
    );
  }
}
