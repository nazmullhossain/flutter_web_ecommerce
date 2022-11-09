import 'package:flutter/material.dart';
import 'package:flutter_ecom_dashboard/const/constant.dart';

import 'order_widgets.dart';

class OrderListWidget extends StatelessWidget {
  const OrderListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,

          itemBuilder: (context,index){
        return Column(
          children: [
            OrderWidget(),
            Divider(thickness: 3,)
          ],
        );
      }),
    );
  }
}
