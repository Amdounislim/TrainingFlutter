import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/language_controller.dart';
import '../localization/localization_service.dart';
import '../routes/app_routes.dart';

class TranslationPage extends StatelessWidget {
  final LanguageController _con = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    var languageCode = Get.locale?.languageCode;
    var languageName = _con.getLanguageName(languageCode!);
    _con.lang.value = languageName;
    return Scaffold(
      appBar: AppBar(
          title: Text("choosethelanguage".tr),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          )),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: Get.height,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                "selectYourPreferredlanguage".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black),
              ),
              SizedBox(height: 40),
              ...LocalizationService.langs.map((String lan) {
                return Column(
                  children: [
                    tileWidget(
                      onTap: () {
                        _con.lang.value = lan;
                      },
                      title: lan,
                    ),
                    SizedBox(height: 10),
                  ],
                );
              }).toList(),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () =>
                    {LocalizationService().changeLocale(_con.lang.value)},
                child: Container(
                  height: Get.height * 0.06,
                  width: Get.width * 0.60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      "confirmLanguage".tr,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Get.height * 0.020,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget tileWidget({
    Function()? onTap,
    String? title,
  }) =>
      Obx(
        () => GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color:
                    title == _con.lang.value ? Colors.blue : Color(0xffD4D4D4),
              ),
            ),
            child: Row(
              children: [
                Text(
                  "$title",
                  style: TextStyle(
                    color:
                        title == _con.lang.value ? Colors.blue : Colors.black,
                  ),
                ),
                Spacer(),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: title == _con.lang.value
                        ? Colors.blue
                        : Colors.blue.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: title == _con.lang.value
                      ? Center(
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 10,
                          ),
                        )
                      : SizedBox(),
                ),
              ],
            ),
          ),
        ),
      );
}
