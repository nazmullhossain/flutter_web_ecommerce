import 'package:flutter/material.dart';
import 'package:flutter_ecom_dashboard/utils/utils.dart';
import 'package:flutter_ecom_dashboard/widgets/responsive_widgets.dart';

import '../const/constant.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.onPressed, required this.title,this.showText=true})
      : super(key: key);
  final VoidCallback onPressed;
  final String title;
   final bool showText ;

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final color = Utils(context).color;
    return Row(
      children: [
        if (!ResponsiveWidget.isDesktop(context))
          IconButton(onPressed: onPressed, icon: Icon(Icons.menu)),
        if (ResponsiveWidget.isDesktop(context))
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        if (ResponsiveWidget.isDesktop(context))
          Spacer(
            flex: ResponsiveWidget.isDesktop(context) ? 2 : 1,
          ),
        showText?Container():   Expanded(
            child: TextField(
          decoration: InputDecoration(
              hintText: "Search",
              fillColor: Theme.of(context).cardColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
              suffixIcon: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(defaultPadding * 0.75),
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Icon(Icons.search),
                ),
              )),
        ))
      ],
    );
  }
}
