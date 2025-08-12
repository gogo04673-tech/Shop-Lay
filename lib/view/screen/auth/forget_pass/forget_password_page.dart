import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/auth/forget_password/forget_password_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';
import 'package:shoplay/core/functions/valid_input.dart';

import 'package:shoplay/view/widget/auth/custombodytext_w.dart';
import 'package:shoplay/view/widget/auth/customtitleaut_w.dart';

import 'package:shoplay/view/widget/custombutton/custombuttoncontainer.dart';
import 'package:shoplay/view/widget/customtextfiled/text_form_filed.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ForgetPasswordControllerImp());
    return Scaffold(
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) {
          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formStateCheck,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 40,
                ),

                child: ListView(
                  children: [
                    // * This is Title page => ForgetPassword
                    const Center(child: CustomTitleAuth(title: "25")),
                    // * This is subtitle page => Please sign in to continue
                    const Center(child: CustomBodyText(text: "26")),

                    // * This is just height
                    const SizedBox(height: 20),

                    // * This is Text Form Filed => Username or email
                    CustomTextFiledForm(
                      hintText: '23',
                      controller: controller.email,
                      validator: (val) {
                        return validationInput(val!, "email", 5, 50);
                      },
                      prefixIcon: Icons.email_outlined,
                    ),

                    // * This is just height
                    const SizedBox(height: 20),

                    // * This is Button to Sign in
                    CustomButtonContainer(
                      title: "27",
                      onTap: () async {
                        await controller.goToVerifyCode();
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
