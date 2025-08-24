import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/remote_pages/contact_us_data.dart';
import 'package:shoplay/data/models/contact_us_m.dart';

abstract class ContactUsController extends GetxController {
  inits();
  getContactUs();
  addContactUs();
  changeValuePage(bool value);
}

class ContactUsControllerImp extends ContactUsController {
  // * Controller Text Filed
  late TextEditingController name;
  late TextEditingController message;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  ContactUsData contactUsData = ContactUsData(Get.find());

  List<ContactUsModel> contactUsList = [];

  // go to historic
  bool changePage = false;

  @override
  void onInit() {
    inits();
    super.onInit();
  }

  @override
  inits() {
    name = TextEditingController();
    message = TextEditingController();
    getContactUs();
  }

  @override
  addContactUs() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await contactUsData.addContactUs(
      myServices.sharedPreferences.getString("id")!,
      name.text,
      message.text,
    );

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homePage);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getContactUs() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await contactUsData.getContactUs(
      myServices.sharedPreferences.getString("id")!,
    );

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var data = response['data'] as List;
        contactUsList.addAll(
          data.map((e) => ContactUsModel.fromJson(e)).toList(),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  changeValuePage(bool value) {
    changePage = value;
    update();
  }
}
