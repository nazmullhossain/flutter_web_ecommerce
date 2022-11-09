import 'package:flutter/material.dart';
import 'package:flutter_ecom_dashboard/utils/utils.dart';
import 'package:flutter_ecom_dashboard/widgets/text_widgets.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme=Utils(context).getTheme;
    Color color=theme==true?Colors.white:Colors.black;
    Size size=Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor.withOpacity(0.4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: size.width<650?3:1,
                child: Image.network("https://lifepng.com/wp-content/uploads/2020/11/Apricot-Large-Single-png-hd.png",
                  fit: BoxFit.fill,
                  // height: size.width *0.12,
                )),
            SizedBox(width: 12,),
            Expanded(
              flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              TextWidget(color: color,
                  maxLines: 1,
                  textSize: 16,
                  isTitle: true,
                  text: "12x for \$19.9"),
                FittedBox(
                  child: Row(
                    children: [
                      TextWidget(color: color,
                          maxLines: 1,
                          textSize: 16,
                          isTitle: true,
                          text: "By"),
                      TextWidget(color: color,
                          maxLines: 1,
                          textSize: 14,
                          isTitle: true,
                          text: "Nazmul"),
                    ],
                  ),
                ),
                Text("20/03/2022")
              ],
            ))
          ],
        ),

      ),
    );
  }
}
