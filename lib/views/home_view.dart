import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  child: Text('Translation page'),
                  onPressed: () {
                    Get.toNamed(AppRoutes.translationPage);
                  }),
              Text('TranslationOfThisText'.tr),
              ElevatedButton(
                child: Text("Posts Page"),
                onPressed: () => Get.toNamed(AppRoutes.posts),
              )
            ],
          ),
        ));
  }
}
