import 'package:fluent_ui/fluent_ui.dart';

class AppTicketSearch extends StatelessWidget {
  final String airLine;
  final bool tabBorder;
  final bool tabColor;
  const AppTicketSearch({super.key, required this.airLine, this.tabBorder = false, this.tabColor = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7),
      width: size.width*0.44,
      decoration: BoxDecoration(
          color: tabColor == false?Colors.white: Colors.transparent,
          borderRadius: tabBorder == false?BorderRadius.horizontal(left: Radius.circular(50)):
          BorderRadius.horizontal(right: Radius.circular(50)),
      ),
      child: Center(child: Text(airLine)),
    );
  }
}
