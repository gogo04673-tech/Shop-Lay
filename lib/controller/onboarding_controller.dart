import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/static/static.dart';

abstract class OnboardingController extends GetxController {
  next();

  back();

  onPageChange(int index);
}

class OnBoardingControllerImp extends OnboardingController {
  int currentPage = 0;

  late PageController pageController;

  MyServices myServices = Get.find();

  @override
  next() {
    currentPage++;

    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", '1');
      Get.offAllNamed(AppRoute.signIn);
    }

    pageController.animateToPage(
      currentPage,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
    update();
  }

  @override
  back() {
    currentPage--;
    pageController.animateToPage(
      currentPage,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
    update();
  }

  @override
  onPageChange(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
