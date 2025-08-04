import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/constant/approutes.dart';

abstract class ResetPasswordController extends GetxController {
  matchPassword();

  goToLogin();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    password = TextEditingController();
    rePassword = TextEditingController();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();

    super.dispose();
  }

  @override
  goToLogin() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      Get.offNamed(AppRoute.signIn);
    } else {
      print("not valid");
    }
  }

  @override
  matchPassword() {}
}
