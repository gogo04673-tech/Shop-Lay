import 'package:geolocator/geolocator.dart';
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

  // * Request a permission Location
  requestPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Get.snackbar("Shop-Lay", "Please allow location.");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Get.snackbar("Shop-Lay", "Please allow location.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar(
        "Shop-Lay",
        "Location permissions are permanently denied, we cannot request permissions.",
      );
    }
  }

  @override
  void onInit() {
    requestPermissionLocation();
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
