import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/app_routes.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/ultils/all_json.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: Text('All Hotels'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              mainAxisSpacing: 12,
                childAspectRatio: 0.9

            ),
            itemCount: hotelList.length,
            itemBuilder: (context, index){
              var singleHotel = hotelList[index];
              return HotelGridView(hotels: singleHotel, index: index);
            }),
      ),
    );
  }
}

class HotelGridView extends StatelessWidget {
  final int index;
  final Map<String, dynamic> hotels;
  const HotelGridView({super.key, required this.hotels, required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
          Navigator.pushNamed(context, AppRoutes.hotelDetail, arguments: {
            'index': index
          });
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        //width: size.width*0.6,
        height: 300,
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            color: AppStyles.primaryColor,
            borderRadius: BorderRadius.circular(18)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(

                decoration: BoxDecoration(
                    color: AppStyles.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/${hotels['image']}",
                        ))
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                hotels['place'],
                style: AppStyles.headLineStyle4.copyWith(color: Colors.grey.shade200),
              ),
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    hotels['destination'],
                    style: AppStyles.headLineStyle2.copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "\$${hotels['price']}/n",
                    style: AppStyles.headLineStyle2.copyWith(color: Colors.grey.shade200),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
