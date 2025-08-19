import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/address/address_data.dart';

abstract class EditAddressController extends GetxController {
  inits();

  addAddressRequest();
}

class EditAddressControllerImp extends EditAddressController {
  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  double? lat;
  double? long;

  late TextEditingController nameAddress;
  late TextEditingController cityAddress;
  late TextEditingController streetAddress;

  @override
  void onInit() {
    inits();
    super.onInit();
  }

  @override
  inits() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    nameAddress = TextEditingController();
    cityAddress = TextEditingController();
    streetAddress = TextEditingController();
  }

  @override
  addAddressRequest() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.editAddressData(
      myServices.sharedPreferences.getString("id")!,
      nameAddress.text,
      cityAddress.text,
      streetAddress.text,
      lat.toString(),
      long.toString(),
    );

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.back();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.servicesFailure;
    }

    update();
  }
}
