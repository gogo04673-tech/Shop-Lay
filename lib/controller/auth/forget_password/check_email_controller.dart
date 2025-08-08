import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/data/datasource/remote/auth/check_email_data.dart';

abstract class CheckEmailController extends GetxController {
  goToVerifyCode();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;

  GlobalKey<FormState> formStateCheckEmail = GlobalKey<FormState>();

  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  StatusRequest? statusRequest;

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
  goToVerifyCode() async {
    var formData = formStateCheckEmail.currentState;
    if (formData!.validate()) {
      // * This request of post and check is success or failure
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        Get.toNamed(AppRoute.homePage);
        update();
      }
    } else {
      print("not valid");
    }
  }
}
