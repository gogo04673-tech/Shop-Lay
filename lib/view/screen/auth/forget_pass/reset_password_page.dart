import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoplay/controller/auth/forget_password/reset_password_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';

import 'package:shoplay/core/functions/valid_input.dart';

import 'package:shoplay/view/widget/auth/custombodytext_w.dart';
import 'package:shoplay/view/widget/auth/customtitleaut_w.dart';

import 'package:shoplay/view/widget/custombutton/custombuttoncontainer.dart';
import 'package:shoplay/view/widget/customtextfiled/text_form_filed.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ResetPasswordControllerImp());

    return Scaffold(
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) {
          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formStateReset,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 40,
                ),

                child: ListView(
                  children: [
                    // * This is Title page => ForgetPassword
                    const Center(child: CustomTitleAuth(title: "29")),
                    // * This is subtitle page => Please sign in to continue
                    const Center(child: CustomBodyText(text: "30")),

                    // * This is just height
                    const SizedBox(height: 20),

                    // * This is Text Form Filed => Username or email
                    CustomTextFiledForm(
                      hintText: '32',
                      controller: controller.password,
                      prefixIcon: Icons.lock_open_outlined,
                      validator: (val) {
                        return validationInput(val!, "", 8, 50);
                      },
                      stateIcon: true,
                    ),

                    // * This is just height
                    const SizedBox(height: 20),

                    // * This is Text Form Filed => Username or email
                    CustomTextFiledForm(
                      hintText: '33',
                      controller: controller.rePassword,
                      prefixIcon: Icons.lock_open_outlined,
                      validator: (val) {
                        return validationInput(val!, "", 8, 50);
                      },
                      stateIcon: true,
                    ),

                    // * This is just height
                    const SizedBox(height: 20),

                    // * This is Button to Sign in
                    CustomButtonContainer(
                      title: "2".tr,
                      onTap: () {
                        controller.goToLogin();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
