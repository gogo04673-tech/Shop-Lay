import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/app_theme.dart';
import 'package:shoplay/core/constant/language.dart';
import 'package:shoplay/core/services/services.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = Get.deviceLocale!.languageCode == "ar"
      ? themeArabic
      : themeEnglish;

  onLanguageChange(langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  changeLang(value) {
    language = Locale(value);
    onLanguageChange(value);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    List<String> langList = Language.languageList;
    List.generate(langList.length, (i) {
      if (sharedPrefLang == langList[i]) {
        language = Locale(langList[i]);
        if (sharedPrefLang == "en") {
          appTheme = themeEnglish;
        } else {
          appTheme = themeArabic;
        }
      } else {
        language = Locale(Get.deviceLocale!.languageCode);
      }
    });

    super.onInit();
  }
}
