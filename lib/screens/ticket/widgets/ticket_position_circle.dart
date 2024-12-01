import 'package:flutter/material.dart';

import '../../../base/res/styles/app_styles.dart';

class TicketPositionCircle extends StatelessWidget {
  final bool? pos;
  const TicketPositionCircle({super.key, this.pos});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left:pos==true? 22:null,
      right: pos==false?22:null,
      top: 275,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 3),

        ),
        child: CircleAvatar(
          maxRadius: 4,
          backgroundColor: AppStyles.textColor,
        ),
      ),
    );
  }
}
