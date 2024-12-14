import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/ultils/all_json.dart';
import 'package:ticket_app/block/text_expansion_blocks.dart';
import 'package:ticket_app/block/text_expansion_events.dart';
import 'package:ticket_app/block/text_expansion_states.dart';
import 'package:ticket_app/controller/text_expansion_controller.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int index = 0;
  @override
  void didChangeDependencies() {
    var args = ModalRoute
        .of(context)!
        .settings
        .arguments as Map;
    print(args['index']);
    index = args['index'];
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);

                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppStyles.primaryColor
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              //title: Text(hotelList[index]['place']),
              background: Stack(
                children: [
                  Positioned.fill(child:  Image.asset('assets/images/${hotelList[index]['image']}',
                    fit: BoxFit.cover,
                  ),),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.black.withOpacity(0.5),
                        child: Text(hotelList[index]['place'],
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: AppStyles.primaryColor,
                              offset: Offset(2.0, 2.0)
                            )
                          ]
                        ),
                        )),)
              ],
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              Padding(
                  padding: EdgeInsets.all(16.0),
              child: ExpandedTextWidget(
                text: hotelList[index]['detail'],)
              ),
              Padding(padding: EdgeInsets.all(16.0),
              child: Text('More Images', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              ),
              Container(
                height: 200,
                width: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: hotelList[index]['images'].length, itemBuilder: (context, imagesIndex){
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Image.asset('assets/images/${hotelList[index]['images'][imagesIndex]}')
                  );
                }),
              )
            ]
          ))
        ],
      ),
    );
  }
}
class ExpandedTextWidget extends StatelessWidget {
  ExpandedTextWidget({super.key, required this.text,});
  final String text;

  @override
  Widget build(BuildContext context) {


      return BlocBuilder<TextExpansionBlocs, TextExpansionStates>(builder: (context, state){
        if(state is IsExpandedState){
          var isExpanded = state.isExpanded;

          var textWidget = Text(
            text,
            maxLines: isExpanded?null:3,
            overflow: isExpanded?TextOverflow.visible:TextOverflow.ellipsis,
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget,
              GestureDetector(
                onTap: (){
                  //controller.toggleExpansion();
                  context.read<TextExpansionBlocs>().add(IsExpandedEvent(!isExpanded));
                },
                child: Text(isExpanded?'less':'more',
                  style: AppStyles.textStyle.copyWith(
                      color: AppStyles.primaryColor
                  ),),
              )
            ],
          );
        }else{
          return Container();
        }

      });
  }
}
