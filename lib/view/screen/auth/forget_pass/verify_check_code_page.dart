import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/auth/verify_code_email_controller.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/view/widget/auth/custombodytext_w.dart';
import 'package:shoplay/view/widget/auth/customtitleaut_w.dart';

class VerifyCodeEmailPage extends StatelessWidget {
  const VerifyCodeEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeEmailControllerImp controller = Get.put(
      VerifyCodeEmailControllerImp(),
    );
    return Scaffold(
      body: Form(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
            child: ListView(
              children: [
                // * This is Title page => VerifyCheckCode
                Center(child: const CustomTitleAuth(title: "28")),
                // * This is subtitle page => Please sign in to continue
                Center(child: const CustomBodyText(text: "31")),

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
                    controller.goToResetPassword();
                  }, // end onSubmit
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
