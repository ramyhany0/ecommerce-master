
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/constants/routes.dart';

import '../../../controller/cart_controller.dart';
import '../../../shared/styles/colors.dart';
import '../shared/default_button.dart';

class BottomNavgationBarCart extends GetView<CartController> {

  final String totalPrice ;
  const BottomNavgationBarCart({Key? key,  required this.totalPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [


        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          elevation: 10,

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text("Total Price",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.defaultColor))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$totalPrice \$",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.defaultColor)))
              ],
            ),
          ),
        ),

    
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 20,left: 20,bottom: 10),
          child: defaultButton(
            onPressed: (){
              controller.goToPageCheckout();
            },
            text: "Buy Now",
          ),
        ),
      ],
    );
  }
}