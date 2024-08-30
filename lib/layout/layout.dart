import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/constants/routes.dart';
import '../controller/cart_controller.dart';
import '../controller/layout_controller.dart';
import '../view/widgets/layout/custom_bottom_appbar_home.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LayoutScreenControllerImplement());

    CartController cartController= Get.put(CartController());

    return GetBuilder<LayoutScreenControllerImplement>(
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,

            appBar: AppBar(
              toolbarHeight: 0,
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {

                  Get.toNamed(AppRoute.cart);

                  cartController.refreshPage();

                },
                child: const Icon(Icons.shopping_cart_sharp)),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,

              body: controller.listScreen.elementAt(controller.currentScreen),

            bottomNavigationBar: const CustomBottomAppBarLayout(),
          );
        });
  }
}






