import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';

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
                    Text('Book Tickets', style: AppStyles.headLineStyle4,),
                    Text('Blantyre', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey.shade500),
                    ),
                    SizedBox(height: 8,),
                    Container(
                      width: 100,
                      height: 30,
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
                              color: Color(0xFF526799)
                            ),
                            child: const Icon(FluentSystemIcons.ic_fluent_shield_filled,
                            color: Colors.white,),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
      ),
    );
  }
}
