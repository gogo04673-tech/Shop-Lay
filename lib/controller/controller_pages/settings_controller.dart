import 'package:get/get.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/services/services.dart';

abstract class SettingsPageController extends GetxController {
  switchMode(bool value);

  goToNotifyPage();
}

class SettingsPageControllerImp extends SettingsPageController {
  MyServices myServices = Get.find();

  bool changeMode = false;

  @override
  switchMode(value) {
    changeMode = value;
    update();
  }

  @override
  goToNotifyPage() {
    Get.toNamed(AppRoute.notificationsPage);
  }
}
