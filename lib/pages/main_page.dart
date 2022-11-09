import 'package:flutter/material.dart';
import 'package:flutter_ecom_dashboard/menu_controller/menu_controller.dart';
import 'package:provider/provider.dart';

import '../widgets/responsive_widgets.dart';
import '../widgets/side_menu_widgets.dart';
import 'dashboard_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().getScaffoldKey,
      drawer: SideMenuWidget(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //we want this side menu onl for large screen
            if(ResponsiveWidget.isDesktop(context))
              Expanded(
                //defualt flex=1
                //and it takes 1/6 part of the screen
                  child: SideMenuWidget()
              ),
            Expanded(
                flex: 5,
                child: DashboardPage())

          ],
        ),
      ),
    );
  }
}
