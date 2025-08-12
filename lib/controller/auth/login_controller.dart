import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/functions/widget_const/dialog/custom_dialog.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/auth/signin_data.dart';

abstract class LoginController extends GetxController {
  signIn();

  goToForgetPassword();

  goToSignUp();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  GlobalKey<FormState> formStateLogin = GlobalKey<FormState>();

  SignInData signInData = SignInData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

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
  signIn() async {
    var formData = formStateLogin.currentState;
    if (formData!.validate()) {
      // * This request of post and check is success or failure
      statusRequest = StatusRequest.loading;
      update();
      var response = await signInData.postData(email.text, password.text);

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        Map data = response['data'];
        myServices.sharedPreferences.setString(
          "id",
          data['users_id'].toString(),
        );
        myServices.sharedPreferences.setString(
          "username",
          data['users_name'].toString(),
        );
        myServices.sharedPreferences.setString(
          "email",
          data['users_email'].toString(),
        );
        myServices.sharedPreferences.setString(
          "phone",
          data['users_phone'].toString(),
        );
        myServices.sharedPreferences.setString("step", "2");

        customDialog("success", "Sign In is Successful.");

        Future.delayed(const Duration(seconds: 2), () {
          if (Get.isDialogOpen ?? false) {
            Get.back();
            Get.offAllNamed(AppRoute.homePage);
          }
        });
        update();
      } else if (StatusRequest.failure == statusRequest) {
        customDialog(
          "Error",
          "Invalid email or password.",
          onTapOkay: () {
            Get.back();
          },
          onTapCancel: () {
            Get.back();
          },
        );
        update();
      }
    } else {
      customDialog("error", "Please fill in each field as appropriate.");
    }
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
