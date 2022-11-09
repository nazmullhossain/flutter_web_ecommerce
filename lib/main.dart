import 'package:flutter/material.dart';
import 'package:flutter_ecom_dashboard/pages/main_page.dart';
import 'package:flutter_ecom_dashboard/pages/upload_product_page.dart';
import 'package:flutter_ecom_dashboard/provider/dark_theme_provider.dart';

import 'package:provider/provider.dart';

import 'const/theme_data.dart';
import 'menu_controller/menu_controller.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme = await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MenuController(),
        ),
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Grocery',
              theme: Styles.themeData(themeProvider.getDarkTheme, context),
              home: const MainPage(),
              routes: {
                UploadProductPage.routeName: (context) =>
                const UploadProductPage(),
              }
              );
        },
      ),
    );
  }
}
