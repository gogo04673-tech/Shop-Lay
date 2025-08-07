import 'package:get/get.dart';
import 'package:shoplay/core/constant/approutes.dart';

abstract class VerifyCodeEmailController extends GetxController {
  checkCode();

  goToResetPassword();
}

class VerifyCodeEmailControllerImp extends VerifyCodeEmailController {
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  checkCode() {}

  @override
  goToResetPassword() {
    Get.toNamed(AppRoute.resetPassword);
  }
}
