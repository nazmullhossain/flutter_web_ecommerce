import 'package:flutter/material.dart';
import 'package:flutter_ecom_dashboard/widgets/product_widgets.dart';

import '../const/constant.dart';
import '../utils/utils.dart';

class GridProductWidget extends StatelessWidget {
  const GridProductWidget({Key? key,
   this.childAspectRatio=1,
     this.crossAxisCount=4,
     this.isMain=true
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
final bool isMain;

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    Color color = Utils(context).color;
    return  GridView.builder(


        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding

        ),
        itemCount: isMain?4:20,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context,index){
          return ProductWidget();
        });
  }
}
