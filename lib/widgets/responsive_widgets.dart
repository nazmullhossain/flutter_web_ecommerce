import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({Key? key,
    required this.desktop,required this.mobile}) : super(key: key);

  final Widget desktop;
  final Widget mobile;

  // this is mobile , is desktop help us later

  static bool isMobile(BuildContext context)=>MediaQuery.of(context).size.width<850;
  static bool isDesktop(BuildContext context)=>MediaQuery.of(context).size.width>=1100;

  @override

  Widget build(BuildContext context) {
    final Size _size=MediaQuery.of(context).size;
    //if our width is more than 1100 then we condsider it a desktop
    if(_size.width>=1100){
      return desktop;
    }
    else{
      return mobile;
    }
    return Scaffold();
  }
}
