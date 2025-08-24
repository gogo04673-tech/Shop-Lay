import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/home_screen_controller.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/core/functions/widget_const/dialog/custom_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        body: PopScope(
          canPop: false, // نمنع الخروج المباشر
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {
              customDialog(
                "error",
                "Are you want back?",
                onTapCancel: () {
                  Get.back(); // يغلق الـ dialog فقط
                },
                onTapOkay: () {
                  exit(0); // يغلق التطبيق
                },
              );
            }
          },
          child: controller.pagesList.elementAt(controller.currentPage),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColor.primaryColor,
          ),
          child: IconButton(
            onPressed: () {
              // controller.goToCart();
              Get.toNamed(AppRoute.cartPage);
            },
            iconSize: 28,
            color: AppColor.grey,
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ),

        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: controller.iconList,
          iconSize: 30,

          activeColor: AppColor.black,
          inactiveColor: AppColor.secondaryColor,
          activeIndex: controller.currentPage,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: controller.changePage,
        ),
      ),
    );
  }
}
