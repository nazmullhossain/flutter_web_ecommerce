import 'package:flutter/material.dart';
import 'package:flutter_ecom_dashboard/pages/all_products.dart';
import 'package:flutter_ecom_dashboard/provider/dark_theme_provider.dart';
import 'package:flutter_ecom_dashboard/utils/utils.dart';
import 'package:provider/provider.dart';

import '../pages/all_order_page.dart';
import '../pages/main_page.dart';
import '../tile/drawer_list_tile.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({Key? key}) : super(key: key);

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  @override
  Widget build(BuildContext context) {
    final theme=Utils(context).getTheme;
    final themeState=Provider.of<DarkThemeProvider>(context);
    final color=Utils(context).color;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Icon(Icons.category,size: 30,)
          ),
          DrawerListTile(onPressed: (){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context)=>MainPage(),
              )
            );
          }, title: "Main",
              icon: Icons.home_filled),


          DrawerListTile(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AllProductPage()));
          }, title: "View All Product",
              icon: Icons.store),


          DrawerListTile(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AllOrderPage()));
          }, title: "View All order",
              icon: Icons.shopping_bag),

          SwitchListTile(
              value: theme,
              title: Text("Theme"),
              secondary: Icon(themeState.getDarkTheme?Icons.dark_mode_outlined
              :Icons.light_mode_outlined),
              onChanged: (value){
                setState(() {
                  themeState.setDarkTheme=value;
                });
              })

        ],
      ),
    );
  }
}
