import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/address/address_data.dart';
import 'package:shoplay/data/datasource/remote/remote_pages/checkout_data.dart';
import 'package:shoplay/data/models/address_m.dart';
import 'package:shoplay/data/models/cart_m.dart';

abstract class CheckoutPageController extends GetxController {
  choiceReceive(String value);
  choiceAddressId(int value);
  choicePayment(String value);
  getAddresses();
  checkoutRequest();
  inits();
}

class CheckoutPageControllerImp extends CheckoutPageController {
  AddressData addressData = AddressData(Get.find());

  CheckoutData checkoutData = CheckoutData(Get.find());

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  List<AddressModel> listAddresses = [];

  String? receive;
  int? addressId;
  String? payment;

  late String couponId;
  late double totalPriceOrder;
  late List<CartModel> orderSummary;

  @override
  void onInit() {
    inits();
    super.onInit();
  }

  @override
  choiceAddressId(int value) {
    addressId = value;
    update();
  }

  @override
  choicePayment(String value) {
    payment = value;
    update();
  }

  @override
  choiceReceive(String value) {
    receive = value;
    update();
  }

  @override
  getAddresses() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.getAddressData(
      myServices.sharedPreferences.getString("id")!,
    );

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List data = response['data'];
        listAddresses.addAll(data.map((e) => AddressModel.fromJson(e)));
        if (listAddresses.isEmpty) statusRequest = StatusRequest.failure;
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
  inits() {
    getAddresses();
    couponId = Get.arguments['couponId'];
    totalPriceOrder = Get.arguments['totalPriceOrder'];
    orderSummary = Get.arguments['orderSummary'];
  }

  @override
  checkoutRequest() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkoutData.checkoutData(
      myServices.sharedPreferences.getString("id")!,
      payment == "cash" ? "0" : "1",
      addressId.toString(),
      receive == 'delivery' ? "0" : "1",
      "3",
      totalPriceOrder.toString(),
      couponId,
    );

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // List data = response['data'];
        // listAddresses.addAll(data.map((e) => AddressModel.fromJson(e)));
        // if (listAddresses.isEmpty) statusRequest = StatusRequest.failure;
        print("====> ....checkout");
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
}
