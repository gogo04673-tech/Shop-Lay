import 'package:get/get.dart';
import 'package:shoplay/core/services/services.dart';

translateDataBase(String columnAr, String columnEn) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnAr;
  } else {
    return columnEn;
  }
}
