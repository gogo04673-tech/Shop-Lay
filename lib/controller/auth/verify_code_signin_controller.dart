import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/functions/widget_const/dialog/custom_dialog.dart';
import 'package:shoplay/data/datasource/remote/auth/verify_code_signup_data.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  goToSignIn(String verifyCodeSignUp);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  late String email;

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  VerifyCodeSignupData verifyCodeSignupData = VerifyCodeSignupData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  goToSignIn(verifyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignupData.postData(email, verifyCodeSignUp);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      customDialog("success", "Sign Up Verify is Successful.");

      Future.delayed(const Duration(seconds: 2), () {
        if (Get.isDialogOpen ?? false) {
          Get.back();
          Get.offAllNamed(AppRoute.signIn);
        }
      });
    } else {
      customDialog("error", "Please fill in each field as appropriate.");
    }
    update();
  }
}
