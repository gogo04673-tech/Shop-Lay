import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/functions/widget_const/dialog/custom_dialog.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/remote_pages/home_data.dart';

abstract class HomePageController extends GetxController {
  getData();

  initializing();
}

class HomePageControllerImp extends HomePageController {
  MyServices myServices = Get.find();

  HomePageData homePageData = HomePageData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  List categories = [];
  List items = [];
  List itemsView = [];

  @override
  void onInit() {
    getData();
    initializing();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homePageData.getData();

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        itemsView.addAll(response['itemView']);
        items.addAll(response['items']);

        update();
      }
    }
  }

  @override
  initializing() {
    myServices.sharedPreferences.getString("username");
    myServices.sharedPreferences.getString("id");
  }
}
