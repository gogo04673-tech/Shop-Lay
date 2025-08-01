// * Import packages dev is here
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// * Import controller is here
import 'package:shoplay/controller/onboarding_controller.dart';

// * Import class is here
import 'package:shoplay/view/widget/custombutton/custombuttoncontainer.dart';

import 'package:shoplay/view/widget/onboarding_w/customdotcontrolleronboarding.dart';
import 'package:shoplay/view/widget/onboarding_w/customslideronboarding.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // * Here is Page View Builder
            const Expanded(flex: 3, child: CustomSliderOnBoarding()),

            // * Here is Custom Dot Controller OnBoarding & Login and Skip
            GetBuilder<OnBoardingControllerImp>(
              builder: (cont) {
                return Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      // * height
                      const SizedBox(height: 30),

                      // * This is Dot controller
                      CustomDotControllerOnBoarding(
                        controller: cont.currentPage,
                      ),

                      // * height
                      const SizedBox(height: 5),

                      // * Button of next
                      CustomButtonContainer(
                        title: cont.currentPage == 0
                            ? "Get Started"
                            : "Continue",
                        onTap: () {
                          cont.next();
                        },
                      ),

                      // * Text skip is here
                      InkWell(
                        onTap: () {
                          cont.currentPage > 0 ? cont.back() : null;
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Text(
                          cont.currentPage > 0 ? "Back" : "",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
