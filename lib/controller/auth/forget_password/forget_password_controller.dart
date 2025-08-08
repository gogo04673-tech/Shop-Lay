import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/data/datasource/remote/auth/check_email_data.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();

  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;

  GlobalKey<FormState> formStateCheck = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;

  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }

  @override
  checkEmail() {}

  @override
  goToVerifyCode() async {
    if (formStateCheck.currentState?.validate() ?? false) {
      // * This request of post and check is success or failure
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      print("======================$response");

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.toNamed(
            AppRoute.verifyCodeCheckEmail,
            arguments: {"email": email.text},
          );
          update();
        }
      }
    } else {
      print("not valid");
    }
  }
}
