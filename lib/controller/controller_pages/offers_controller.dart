import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/remote_pages/offers_data.dart';
import 'package:shoplay/data/models/item_m.dart';

class OffersController extends GetxController {
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  OffersData offersData = OffersData(Get.find());

  // List Item Model offers
  List<ItemModel> offersList = [];

  @override
  onInit() {
    getOffersData();
    super.onInit();
  }

  getOffersData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await offersData.getData();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List data = response['data'];

        if (data.isNotEmpty) {
          offersList.addAll(data.map((e) => ItemModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToItemDetails(itemModel) {
    Get.toNamed(AppRoute.itemDetailsPage, arguments: {"itemModel": itemModel});
  }
}
