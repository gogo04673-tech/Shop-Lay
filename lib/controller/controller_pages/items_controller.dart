import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/remote_pages/items_data.dart';
import 'package:shoplay/data/models/item_m.dart';

abstract class ItemsController extends GetxController {
  changeCategory(int value, String catId);
  getItemsData(String categoryId);
  goToItemDetails(ItemModel itemModel);
}

class ItemsControllerImp extends ItemsController {
  late List categories;
  late int selectCategory;
  late String categoryId;
  List items = [];

  MyServices myServices = Get.find();

  ItemsPageData itemsPageData = ItemsPageData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    categories = Get.arguments['categories'];
    selectCategory = Get.arguments['selectCategory'];
    categoryId = Get.arguments['categoryId'];
    getItemsData(categoryId);
    super.onInit();
  }

  @override
  changeCategory(value, catId) {
    selectCategory = value;
    categoryId = catId;
    getItemsData(categoryId);
    update();
  }

  @override
  getItemsData(categoryId) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsPageData.getData(categoryId);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items.addAll(response['items']);
        if (items.isEmpty) {
          statusRequest = StatusRequest.failure;
          update();
        }
        update();
      }
    }
  }

  @override
  goToItemDetails(itemModel) {
    Get.toNamed(AppRoute.itemDetailsPage, arguments: {"itemModel": itemModel});
  }
}
