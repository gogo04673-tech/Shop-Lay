import 'package:flutter/material.dart';
import 'package:shoplay/controller/onboarding_controller.dart';
import 'package:shoplay/data/datasource/static/static.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: controller.onPageChange,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) {
        var boarding = onBoardingList[i];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // * this title page onboarding
            Text(
              "${boarding.title}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            // * This is image page onboarding
            Image.asset("${boarding.image}", width: 350, height: 350),

            // * This is body page onboarding
            Text(
              "${boarding.body}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        );
      },
    );
  }
}
