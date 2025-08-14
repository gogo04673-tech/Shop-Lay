import 'package:get/get.dart';

abstract class NotificationController extends GetxController {
  activeOrderStatus(bool value);
  activeDeliveryUpdates(bool value);
  activeSalesAlerts(bool value);
  activeBackInStock(bool value);
}

class NotificationControllerImp extends NotificationController {
  bool orderStatus = false;

  bool deliveryUpdates = false;

  bool salesAlerts = false;

  bool backInStock = false;

  @override
  activeBackInStock(value) {
    backInStock = value;
    update();
  }

  @override
  activeDeliveryUpdates(value) {
    deliveryUpdates = value;
    update();
  }

  @override
  activeOrderStatus(value) {
    orderStatus = value;
    update();
  }

  @override
  activeSalesAlerts(value) {
    salesAlerts = value;
    update();
  }
}
