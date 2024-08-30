
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/checkout_controller.dart';
import '../../shared/constants/image_assets.dart';
import '../../shared/constants/routes.dart';
import '../../shared/styles/colors.dart';
import '../widgets/checkout/carddeliveerytype.dart';
import '../widgets/checkout/cardpaymentmethod.dart';
import '../widgets/checkout/cardshippingaddress.dart';
import '../widgets/shared/default_button.dart';

class CheckoutScreen  extends StatelessWidget {
  const CheckoutScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),

      bottomNavigationBar:    Padding(
        padding: const EdgeInsets.only(right: 20,left: 20,bottom: 10),
        child: defaultButton(
          onPressed: (){

            // Get.toNamed(AppRoute.checkout);
          },
          text: "Checkout",
        ),
      ),

      body: GetBuilder<CheckoutController>(
        builder: (controller) {


          return Container(

            padding: const EdgeInsets.all(16),

            child: ListView(
              children:[
                const Text(
                  "Choose Payment Method",
                  style: TextStyle(
                      color: AppColor.defaultColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                ),
             const SizedBox(height: 10,),

                InkWell(
                  onTap: () {
                    controller.choosePaymentMethod("1");
                  },
                  child: CardPaymentMethodCheckout(
                      title: "Cash On Delivery",
                      isActive: controller.paymentMethod == "1"
                          ? true
                          : false),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.choosePaymentMethod("2");
                  },
                  child: CardPaymentMethodCheckout(
                      title: "Payment Cards",
                      isActive: controller.paymentMethod == "2"
                          ? true
                          : false),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Choose Delivery Type",
                  style: TextStyle(
                      color: AppColor.defaultColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryType("delivery");
                      },
                      child: CardDeliveryTypeCheckout(
                          imageName: AppImageAsset.deliveryImage2,
                          title: "Delivery",
                          active: controller.deliveryType == "delivery"
                              ? true
                              : false),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryType("receive");
                      },
                      child: CardDeliveryTypeCheckout(
                          imageName: AppImageAsset.drivethruImage,
                          title: "Receive",
                          active: controller.deliveryType == "receive"
                              ? true
                              : false),
                    ),
                  ],
                ),


                const SizedBox(height: 20),
                if (controller.deliveryType == "delivery")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Shipping Address",
                        style: TextStyle(
                            color: AppColor.defaultColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      ...List.generate(
                        controller.data.length,
                            (index) => InkWell(
                          onTap: () {
                            controller.chooseShippingAddress(
                                controller.data[index].id.toString()!);
                          },
                          child: CardShppingAddressCheckout(
                              title:
                              "${controller.data[index].city}",
                              body:
                              "${controller.data[index].region} ${controller.data[index].details}",
                              isactive: controller.addressid ==
                                  controller
                                      .data[index].id.toString()
                                  ? true
                                  : false),
                        ),
                      )
                    ],
                  ),



              ],
            ),
          );
        }
      ),

    );
  }
}
