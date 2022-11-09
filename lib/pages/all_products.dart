import 'package:flutter/material.dart';
import 'package:flutter_ecom_dashboard/menu_controller/menu_controller.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../widgets/grid_product_widgets.dart';
import '../widgets/header_widgets.dart';
import '../widgets/responsive_widgets.dart';
import '../widgets/side_menu_widgets.dart';
import 'dashboard_page.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({Key? key}) : super(key: key);

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    Color color = Utils(context).color;
    return Scaffold(
      key: context.read<MenuController>().getScaffoldKey,
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
                  child: Column(
                    children: [
                      HeaderWidget(
                        onPressed: () {
                          context.read<MenuController>().controlProductsMenu();
                        }, title: 'All Product',
                      ),
                      ResponsiveWidget(

                          desktop: GridProductWidget(
                            isMain: false,
                            childAspectRatio: size.width < 1400 ? 0.8 : 1.05,
                          ),
                          mobile: GridProductWidget(
                            isMain: false,
                            crossAxisCount: size.width < 650 ? 2 : 4,
                            childAspectRatio:
                            size.width < 650 && size.width > 350
                                ? 1.1
                                : 0.8,
                          ))
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
