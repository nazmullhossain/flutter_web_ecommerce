import 'package:flutter/material.dart';
import 'package:flutter_ecom_dashboard/utils/utils.dart';
import 'package:flutter_ecom_dashboard/widgets/text_widgets.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size=Utils(context).getScreenSize;
    final color=Utils(context).color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor.withOpacity(0.6),
        child: InkWell(
          onTap: (){},
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                        child: Image.network("https://lifepng.com/wp-content/uploads/2020/11/Apricot-Large-Single-png-hd.png",
                          fit: BoxFit.fill,
                        height: size.width *0.12,
                        )
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 1,),
                Row(
                  children: [
                    TextWidget(color: color,
                        maxLines: 1,
                        textSize: 15,
                        text: "\$1.99"),
                    const SizedBox(
                      width: 2,
                    ),
                    const Visibility(
                      visible: true,
                        child: Text("\$3.89",style: TextStyle(
                          decoration: TextDecoration.lineThrough
                        ),)),
                    const Spacer(),
                    PopupMenuButton(itemBuilder: (context)=>[
                      PopupMenuItem(
                          onTap: (){},
                          child: Text('Edit'),
                      value: 1,),
                      PopupMenuItem(
                        onTap: (){},
                        child: Text('Delete',style: TextStyle(
                            color: Colors.red
                        ),),
                        value: 2,)
                    ]),

                    TextWidget(color: color,
                        maxLines: 1,
                        textSize: 14,
                        text: "1kg")
                  ],
                )
                ,const SizedBox(height: 2,),
                TextWidget(color: color,
                    maxLines: 1, textSize: 14, text: "Title")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
