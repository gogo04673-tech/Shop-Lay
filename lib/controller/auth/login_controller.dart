import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/constant/approutes.dart';

abstract class LoginController extends GetxController {
  signIn();

  goToForgetPassword();

  goToSignUp();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  @override
  signIn() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      print("valid");
    } else {
      print("not valid");
    }
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
