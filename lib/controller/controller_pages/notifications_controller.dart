import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/remote_pages/notify_data.dart';
import 'package:shoplay/data/models/notify_m.dart';

abstract class NotificationsController extends GetxController {
  getAllNotifications();
}

class NotificationsControllerImp extends NotificationsController {
  List<NotifyModel> notifyList = [];

  NotifyData notifyData = NotifyData(Get.find());

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    getAllNotifications();
    super.onInit();
  }

  @override
  getAllNotifications() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notifyData.getNotificationsData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List data = response['data'];

        if (data.isNotEmpty) {
          notifyList.addAll(data.map((e) => NotifyModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
