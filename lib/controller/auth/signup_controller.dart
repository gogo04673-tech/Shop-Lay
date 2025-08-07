import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/data/datasource/remote/auth/signup_data.dart';

abstract class SignupController extends GetxController {
  signUp();

  goToSignIn();
}

class SignupControllerImp extends SignupController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  SignUpData testRemote = SignUpData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();

    super.dispose();
  }

  @override
  goToSignIn() {
    Get.toNamed(AppRoute.signIn);
  }

  @override
  signUp() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      // * This request of post and check is success or failure
      statusRequest = StatusRequest.loading;

      var response = await SignUpData.postData(
        username.text,
        email.text,
        phone.text,
        password.text,
      );

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        data.addAll(response['data']);
        Get.toNamed(AppRoute.verifyCode);
      }
      update();
    } else {
      print("not valid");
    }
  }
}
