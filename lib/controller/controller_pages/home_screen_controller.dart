import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/view/screen/pages/home_page.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
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
    const Column(children: [Center(child: Text("Pages"))]),
    const Column(children: [Center(child: Text("Pages"))]),
  ];
  int currentPage = 0;
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
