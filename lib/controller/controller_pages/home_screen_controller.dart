import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/view/screen/pages/favorite_page.dart';
import 'package:shoplay/view/screen/pages/home_page.dart';
import 'package:shoplay/view/screen/settings/profile_page.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
  goToCart();
}

class HomeScreenControllerImp extends HomeScreenController {
  List<IconData> iconList = [
    Icons.home_filled,
    Icons.list,
    Icons.favorite_outline_outlined,
    Icons.person_outline_sharp,
  ];

  // * Pages
  List pagesList = [
    const HomePage(),
    const Column(children: [Center(child: Text("Pages"))]),
    const FavoritePage(),
    const ProfilePage(),
  ];
  int currentPage = 0;
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoute.cartPage);
  }
}
