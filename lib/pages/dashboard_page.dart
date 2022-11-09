import 'package:flutter/material.dart';
import 'package:flutter_ecom_dashboard/pages/upload_product_page.dart';
import 'package:flutter_ecom_dashboard/services/global_method_service.dart';

import 'package:provider/provider.dart';

import '../const/constant.dart';

import '../menu_controller/menu_controller.dart';
import '../utils/utils.dart';

import '../widgets/button_widgets.dart';
import '../widgets/grid_product_widgets.dart';
import '../widgets/header_widgets.dart';

import '../widgets/order_list_widgets.dart';
import '../widgets/product_widgets.dart';
import '../widgets/responsive_widgets.dart';
import '../widgets/text_widgets.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    GlobalMethods _globalMethod=GlobalMethods();
    Color color = Utils(context).color;
    return SafeArea(
      child: SingleChildScrollView(
        controller: ScrollController(),
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            HeaderWidget(
              onPressed: () {
                context.read<MenuController>().controlAddProductsMenu();
              }, title: 'Dashbord',
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: 'Latest Products',
              color: color,
              maxLines: 1,
              textSize: 18,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 ButtonWidget(onPressed: (){}, icon: Icons.store, text: "View All", backgroundColor: Colors.blue),
                 ButtonWidget(onPressed: (){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UploadProductPage()));
                 }, icon: Icons.add, text: "Add Product", backgroundColor: Colors.blue),
                ],
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  // flex: 5,
                  child: Column(
                    children: [
                      ResponsiveWidget(
                          desktop: GridProductWidget(
                            childAspectRatio: size.width < 1400 ? 0.8 : 1.05,
                          ),
                          mobile: GridProductWidget(
                            crossAxisCount: size.width < 650 ? 2 : 4,
                            childAspectRatio:
                                size.width < 650 && size.width > 350
                                    ? 1.1
                                    : 0.8,
                          )),
                      OrderListWidget()
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
