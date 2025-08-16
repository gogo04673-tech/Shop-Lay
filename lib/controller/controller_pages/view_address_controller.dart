import 'package:get/get.dart';
import 'package:shoplay/core/constant/approutes.dart';

abstract class ViewAddressController extends GetxController {
  goToAddAddress();
}

class ViewAddressControllerImp extends ViewAddressController {
  @override
  goToAddAddress() {
    Get.toNamed(AppRoute.addAddressPage);
  }
}
