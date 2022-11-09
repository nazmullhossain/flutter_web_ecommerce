import 'package:flutter/material.dart';
import 'package:flutter_ecom_dashboard/const/constant.dart';
import 'package:flutter_ecom_dashboard/widgets/responsive_widgets.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key,
  required this.onPressed,
    required this.icon,
    required this.text,
    required this.backgroundColor,
    
  }) : super(key: key);


  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(
            horizontal: defaultPadding *1.5,
            vertical: defaultPadding /(ResponsiveWidget.isDesktop(context)?1:2)
          )
        ),
        onPressed: onPressed, 
        icon: Icon(icon,size: 20,), 
        label: Text(text));
  }
}
