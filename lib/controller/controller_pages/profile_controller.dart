import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/services/services.dart';

abstract class ProfileController extends GetxController {
  inits();
}

class ProfileControllerImp extends ProfileController {
  MyServices myServices = Get.find();

  String? username;
  String? email;

  late List<Map> itemsProfile;

  @override
  void onInit() {
    inits();
    super.onInit();
  }

  @override
  inits() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    itemsProfile = [
      {
        "name": "Orders",
        "leading": Icons.add_box,
        "function": () {
          Get.toNamed(AppRoute.ordersPendingPage);
        },
      },
      {
        "name": "Wishlist",
        "leading": Icons.favorite_border_outlined,
        "function": () {
          Get.toNamed(AppRoute.favoritePage);
        },
      },
      {
        "name": "Address",
        "leading": Icons.location_on_outlined,
        "function": () {
          Get.toNamed(AppRoute.viewAddressPage);
        },
      },
      {
        "name": "Settings",
        "leading": Icons.settings,
        "function": () {
          Get.toNamed(AppRoute.settingsPage);
        },
      },

      {
        "name": "Log Out",
        "leading": Icons.logout_outlined,
        "function": () {
          FirebaseMessaging.instance.unsubscribeFromTopic("users");
          FirebaseMessaging.instance.unsubscribeFromTopic(
            "users${myServices.sharedPreferences.getString("id")}",
          );
          myServices.sharedPreferences.clear();
          Get.offAllNamed(AppRoute.signIn);
        },
      },
    ];
  }
}
