import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/auth/login_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/core/constant/imageassets.dart';
import 'package:shoplay/core/functions/valid_input.dart';
import 'package:shoplay/view/widget/auth/custom_text_switch_w.dart';
import 'package:shoplay/view/widget/auth/custombodytext_w.dart';
import 'package:shoplay/view/widget/auth/customtitleaut_w.dart';
import 'package:shoplay/view/widget/auth/row_icon_another_w.dart';
import 'package:shoplay/view/widget/custombutton/custombuttoncontainer.dart';
import 'package:shoplay/view/widget/customtextfiled/text_form_filed.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginControllerImp());
    return Scaffold(
      body: GetBuilder<LoginControllerImp>(
        builder: (controller) {
          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formStateLogin,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: ListView(
                  children: [
                    // * This is Image
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 28, bottom: 10),
                      child: Image.asset(AppImageAssets.loginImage, width: 300),
                    ),

                    // * This is Title page => Login
                    const CustomTitleAuth(title: "11"),

                    // * This is subtitle page => Please sign in to continue
                    const CustomBodyText(text: "12"),

                    // * This is just height
                    const SizedBox(height: 20),

                    // * This is Text Form Filed => Username or email
                    CustomTextFiledForm(
                      hintText: '13',
                      controller: controller.email,
                      validator: (val) {
                        return validationInput(val!, "email", 5, 50);
                      },
                      prefixIcon: Icons.person_2_outlined,
                    ),

                    // * This is just height
                    const SizedBox(height: 20),

                    // * This is Text Form Filed => Password
                    CustomTextFiledForm(
                      hintText: '14',
                      controller: controller.password,
                      validator: (val) {
                        return validationInput(val!, "password", 8, 40);
                      },
                      prefixIcon: Icons.lock_outline,
                      stateIcon: true,
                    ),

                    // * This is Text forget password
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },

                        child: Text(
                          "15".tr,
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColor.grey,
                              ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    // * This is Button to Sign in
                    CustomButtonContainer(
                      title: "16",
                      onTap: () {
                        controller.signIn();
                      },
                    ),

                    // * Height
                    const SizedBox(height: 20),

                    // * This is another sign in => google  and facebook...
                    const RowIconAnother(),

                    // * Height
                    const SizedBox(height: 20),

                    // * This is text go to sign up => Don't have account? Sign up.
                    CustomTextSwitch(
                      onTap: () {
                        controller.goToSignUp();
                      },
                      text1: "17",
                      text2: '18',
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
