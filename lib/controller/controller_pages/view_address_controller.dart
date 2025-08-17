import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/address/address_data.dart';
import 'package:shoplay/data/models/address_m.dart';

abstract class ViewAddressController extends GetxController {
  goToAddAddress();

  getAddressDataRequest();

  deleteAddressDataRequest(int addressId);
}

class ViewAddressControllerImp extends ViewAddressController {
  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  List<AddressModel> listAddress = [];

  @override
  void onInit() {
    getAddressDataRequest();
    super.onInit();
  }

  @override
  goToAddAddress() {
    Get.toNamed(AppRoute.addAddressPage);
  }

  @override
  getAddressDataRequest() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.getAddressData(
      myServices.sharedPreferences.getString("id")!,
    );

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List data = response['data'];
        listAddress.addAll(data.map((e) => AddressModel.fromJson(e)));
        if (listAddress.isEmpty) statusRequest = StatusRequest.failure;
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else if (StatusRequest.failure == statusRequest) {
      statusRequest = StatusRequest.failure;
    } else {
      statusRequest = StatusRequest.servicesFailure;
    }

    update();
  }

  @override
  deleteAddressDataRequest(addressId) {
    addressData.deleteAddressData(addressId.toString());
    listAddress.removeWhere((e) => e.addressId == addressId);
    if (listAddress.isEmpty) statusRequest = StatusRequest.failure;
    update();
  }
}
