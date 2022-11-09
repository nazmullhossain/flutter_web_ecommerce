import 'package:flutter/material.dart';
import 'package:flutter_ecom_dashboard/menu_controller/menu_controller.dart';
import 'package:flutter_ecom_dashboard/widgets/order_list_widgets.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../widgets/grid_product_widgets.dart';
import '../widgets/header_widgets.dart';
import '../widgets/responsive_widgets.dart';
import '../widgets/side_menu_widgets.dart';


class AllOrderPage extends StatefulWidget {
  const AllOrderPage({Key? key}) : super(key: key);

  @override
  State<AllOrderPage> createState() => _AllOrderPageState();
}

class _AllOrderPageState extends State<AllOrderPage> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    Color color = Utils(context).color;
    return Scaffold(
        key: context.read<MenuController>().getOrdersScaffoldKey,
        drawer: SideMenuWidget(),
        body:  SafeArea(
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
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: Column(
                      children: [
                        HeaderWidget(
                          onPressed: () {
                            context.read<MenuController>().controlAllOrder();
                          }, title: 'All Order',
                        ),
                        SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OrderListWidget(),
                        )
                      ],
                    ),
                  )

              )

            ],
          ),
        )
    );
  }
}
