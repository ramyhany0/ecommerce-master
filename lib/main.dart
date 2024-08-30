import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app_advanced/shared/services/changelocal.dart';
import 'package:store_app_advanced/shared/services/services.dart';
import 'package:store_app_advanced/shared/styles/themes.dart';
import 'bindings/intialbindings.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(

    DevicePreview(
      enabled: true,
      builder: (context) => const EcommerceApp(),
    ),
  );

}


class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      getPages:routes,
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      theme: lightTheme,
      initialBinding: initialBindings(),
       );
  }
}

