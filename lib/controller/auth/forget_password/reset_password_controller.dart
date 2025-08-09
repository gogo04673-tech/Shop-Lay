import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/functions/widget_const/dialog/custom_dialog.dart';
import 'package:shoplay/data/datasource/remote/auth/reset_pass_data.dart';

abstract class ResetPasswordController extends GetxController {
  matchPassword();

  goToLogin();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;

  GlobalKey<FormState> formStateReset = GlobalKey<FormState>();

  ResetPassData resetPassData = ResetPassData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  late String email;

  @override
  void onInit() {
    super.onInit();
    password = TextEditingController();
    rePassword = TextEditingController();
    email = Get.arguments['email'];
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();

    super.dispose();
  }

  @override
  goToLogin() async {
    if (formStateReset.currentState?.validate() ?? false) {
      if (password.text != rePassword.text) {
        Get.snackbar("Failure Password", "Password is not same RePassword");
      } else {
        // * This request of post and check is success or failure
        statusRequest = StatusRequest.loading;
        update();
        var response = await resetPassData.postData(email, password.text);

        statusRequest = handlingData(response);

        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            customDialog("success", "Reset Password is Successful.");

            Future.delayed(Duration(seconds: 2), () {
              if (Get.isDialogOpen ?? false) {
                Get.back();
                Get.offAllNamed(AppRoute.signIn);
              }
            });
            update();
          }
        }
      }
    } else {
      customDialog("error", "Please fill in each field as appropriate.");
    }
  }

  @override
  matchPassword() {}
}
