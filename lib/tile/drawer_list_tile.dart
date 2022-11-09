import 'package:flutter/material.dart';
import 'package:flutter_ecom_dashboard/utils/utils.dart';

import '../widgets/text_widgets.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({Key? key,
  required this.onPressed,
  required this.title,
  required this.icon}) : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
   final theme=Utils(context).getTheme;
   final color=Theme==true?Colors.white:Colors.black;
    return  ListTile(
      onTap: onPressed,
      horizontalTitleGap: 10.0,
      leading: Icon(
        icon,size: 18,
      ),
      title: TextWidget(color: color, maxLines: 1, textSize: 12, text: title),
    );
  }
}
