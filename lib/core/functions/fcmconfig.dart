import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/orders_pending_controller.dart';

requestPermissionNotification() async {
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig() {
  FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    Get.snackbar(event.notification!.title!, event.notification!.body!);
    refreshPageNotification(event.data);
  });
}

refreshPageNotification(data) {
  if (Get.currentRoute == "/ordersPendingPage" &&
      data['pagename'] == "refreshPageOrders") {
    OrdersPendingControllerImp controller = Get.find();
    controller.refreshPage();
  }
}
