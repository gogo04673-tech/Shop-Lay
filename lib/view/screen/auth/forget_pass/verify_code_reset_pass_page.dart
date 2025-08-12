import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import 'package:shoplay/controller/auth/forget_password/verify_code_reset_pass_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';

import 'package:shoplay/core/constant/colors.dart';

import 'package:shoplay/view/widget/auth/custombodytext_w.dart';
import 'package:shoplay/view/widget/auth/customtitleaut_w.dart';

class VerifyCodeResetPagePage extends StatelessWidget {
  const VerifyCodeResetPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeRestPassControllerImp());
    return Scaffold(
      body: GetBuilder<VerifyCodeRestPassControllerImp>(
        builder: (controller) {
          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              child: ListView(
                children: [
                  const SizedBox(height: 40),
                  // * This is Title page => VerifyCheckCode
                  const Center(child: CustomTitleAuth(title: "28")),

                  const SizedBox(height: 20),

                  // * This is subtitle page => Please sign in to continue
                  const Center(child: CustomBodyText(text: "31")),

                  // * This is just height
                  const SizedBox(height: 20),

                  OtpTextField(
                    numberOfFields: 5,
                    fieldWidth: 50,
                    borderRadius: BorderRadius.circular(20),
                    borderColor: AppColor.primaryColor,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      // Get.toNamed(AppRoute.resetPassword);
                      controller.goToResetPass(verificationCode);
                    }, // end onSubmit
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
