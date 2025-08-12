import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/auth/signup_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';
import 'package:shoplay/core/constant/imageassets.dart';
import 'package:shoplay/core/functions/valid_input.dart';

import 'package:shoplay/view/widget/auth/custom_text_switch_w.dart';
import 'package:shoplay/view/widget/auth/custombodytext_w.dart';
import 'package:shoplay/view/widget/auth/customtitleaut_w.dart';
import 'package:shoplay/view/widget/auth/row_icon_another_w.dart';
import 'package:shoplay/view/widget/custombutton/custombuttoncontainer.dart';
import 'package:shoplay/view/widget/customtextfiled/text_form_filed.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignupControllerImp());
    return Scaffold(
      body: GetBuilder<SignupControllerImp>(
        builder: (controller) {
          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formStateSignUp,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children: [
                    // * This is Image
                    Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.only(left: 60, bottom: 10),
                      child: Image.asset(
                        AppImageAssets.signUpImage,
                        width: 250,
                      ),
                    ),

                    // * This is Title page => SignUp
                    const CustomTitleAuth(title: "19"),
                    // * This is subtitle page => Please sign in to continue
                    const CustomBodyText(text: "20"),

                    // * This is just height
                    const SizedBox(height: 15),

                    // * This is Text Form Filed => Username
                    CustomTextFiledForm(
                      hintText: '21',
                      controller: controller.username,
                      validator: (val) {
                        return validationInput(val!, "username", 5, 30);
                      },
                      prefixIcon: Icons.person_2_outlined,
                    ),

                    // * This is just height
                    const SizedBox(height: 15),

                    // * This is Text Form Filed => Password
                    CustomTextFiledForm(
                      hintText: '23',
                      controller: controller.email,
                      validator: (val) {
                        return validationInput(val!, "email", 5, 50);
                      },
                      prefixIcon: Icons.email_outlined,
                    ),

                    // * This is just height
                    const SizedBox(height: 15),

                    // * This is Text Form Filed => Username or email
                    CustomTextFiledForm(
                      hintText: '24',
                      controller: controller.phone,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      validator: (val) {
                        return validationInput(val!, "phone", 9, 20);
                      },
                      prefixIcon: Icons.phone_android_outlined,
                    ),

                    // * This is just height
                    const SizedBox(height: 15),

                    // * This is Text Form Filed => Password
                    CustomTextFiledForm(
                      hintText: '14',
                      controller: controller.password,
                      validator: (val) {
                        return validationInput(val!, "", 5, 50);
                      },
                      prefixIcon: Icons.lock_outline,
                      stateIcon: true,
                    ),

                    const SizedBox(height: 10),

                    // * This is Button to Sign in
                    CustomButtonContainer(
                      title: "18",
                      onTap: () {
                        controller.signUp();
                      },
                    ),

                    const SizedBox(height: 10),

                    // * This is another sign in => google  and facebook...
                    const RowIconAnother(),

                    // * Height
                    const SizedBox(height: 10),

                    // * This is text go to sign up => Don't have account? Sign up.
                    CustomTextSwitch(
                      onTap: () {
                        controller.goToSignIn();
                      },
                      text1: "22",
                      text2: '16',
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
