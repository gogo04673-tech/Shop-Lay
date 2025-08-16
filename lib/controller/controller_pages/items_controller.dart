import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/remote_pages/home_data.dart';
import 'package:shoplay/data/datasource/remote/remote_pages/items_data.dart';
import 'package:shoplay/data/models/item_m.dart';

abstract class ItemsController extends GetxController {
  changeCategory(int value, String catId);

  getItemsData(String categoryId);
  goToItemDetails(ItemModel itemModel);

  onSearch();

  onChange(String value);

  onPressedSearch();
}

class ItemsControllerImp extends ItemsController {
  late TextEditingController search;

  bool isSearch = false;

  List<ItemModel> listSearch = [];

  late List categories;
  late int selectCategory;
  late String categoryId;
  List items = [];

  MyServices myServices = Get.find();

  ItemsPageData itemsPageData = ItemsPageData(Get.find());
  HomePageData homePageData = HomePageData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    categories = Get.arguments['categories'];
    selectCategory = Get.arguments['selectCategory'];
    categoryId = Get.arguments['categoryId'];
    search = TextEditingController();
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
    var response = await itemsPageData.getData(
      categoryId,
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItemDetails(itemModel) {
    Get.toNamed(AppRoute.itemDetailsPage, arguments: {"itemModel": itemModel});
  }

  @override
  onChange(String value) {
    if (value == '') {
      isSearch = false;
      listSearch.clear();
    }
    update();
  }

  @override
  onPressedSearch() {
    isSearch = true;
    onSearch();
    update();
  }

  @override
  onSearch() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homePageData.getSearchData(search.text);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listSearch.clear();
        List data = response['data'];
        listSearch.addAll(data.map((e) => ItemModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
