import 'package:fluent_ui/fluent_ui.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_search.dart';

class AppTicketTabs extends StatelessWidget {
  final  String fistTab;
  final String finalTab;
  const AppTicketTabs({super.key, required this.fistTab, required this.finalTab});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          AppTicketSearch(
              airLine: fistTab),
          AppTicketSearch(
              airLine: finalTab,
              tabBorder: true,
            tabColor: true,
          ),

        ],
      ),
    );
  }
}
