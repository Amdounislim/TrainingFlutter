import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training1/bindings/my_bindings.dart';
import 'package:training1/routes/app_routes.dart';

import 'localization/localization_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.home,
      locale: Get.deviceLocale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),

      initialBinding: MyBindings(),
    );
  }
}
