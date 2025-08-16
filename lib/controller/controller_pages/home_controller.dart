import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/functions/handling_data.dart';

import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/remote_pages/home_data.dart';
import 'package:shoplay/data/models/item_m.dart';

abstract class HomePageController extends GetxController {
  getData();

  initializing();

  onSearch();

  onChange(String value);

  onPressedSearch();

  goToItems(List categories, int selectCategory, String categoryId);
}

class HomePageControllerImp extends HomePageController {
  MyServices myServices = Get.find();

  HomePageData homePageData = HomePageData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController search;

  bool isSearch = false;

  List<ItemModel> listSearch = [];

  List categories = [];
  List items = [];
  List itemsView = [];

  @override
  void onInit() {
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
    search = TextEditingController();
    getData();
    myServices.sharedPreferences.getString("username");
    myServices.sharedPreferences.getString("id");
  }

  @override
  goToItems(List categories, int selectCategory, categoryId) {
    Get.toNamed(
      AppRoute.itemsPage,
      arguments: {
        'categories': categories,
        'selectCategory': selectCategory,
        "categoryId": categoryId,
      },
    );
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

class SearchController extends GetxController {
  MyServices myServices = Get.find();

  HomePageData homePageData = HomePageData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController search;

  bool isSearch = false;

  List<ItemModel> listSearch = [];

  onChange(String value) {
    if (value == '') {
      isSearch = false;
      listSearch.clear();
    }
    update();
  }

  onPressedSearch() {
    isSearch = true;
    onSearch();
    update();
  }

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
