import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/functions/widget_const/dialog/custom_dialog.dart';
import 'package:shoplay/data/datasource/remote/auth/verify_code_reset_pass_data.dart';

abstract class VerifyCodeRestPassController extends GetxController {
  goToResetPass(String verifyCodeSignUp);
}

class VerifyCodeRestPassControllerImp extends VerifyCodeRestPassController {
  late String email;

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  VerifyCodeResetPassData verifyCodeResetPassData = VerifyCodeResetPassData(
    Get.find(),
  );

  StatusRequest statusRequest = StatusRequest.none;

  @override
  goToResetPass(verifyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeResetPassData.postData(
      email,
      verifyCodeSignUp,
    );

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      Get.toNamed(AppRoute.resetPassword, arguments: {"email": email});
    } else {
      customDialog("error", "Please fill in each field as appropriate.");
    }
    update();
  }
}
