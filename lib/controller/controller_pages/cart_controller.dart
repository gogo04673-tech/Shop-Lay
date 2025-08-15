import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/remote_pages/cart_data.dart';
import 'package:shoplay/data/models/cart_m.dart';

abstract class CartPageController extends GetxController {
  addItemToCart(int itemId);

  deleteItemFromCart(int itemId);

  add(int itemId);

  remove(int itemId);

  //countItemFromCart(int itemId);

  viewCartData();
}

class CartPageControllerImp extends CartPageController {
  CartData cartData = CartData(Get.find());

  MyServices myServices = Get.find();

  //int countItem = 0;

  int totalItems = 0;

  double totalPriceItems = 0;

  List<CartModel> cartItemsData = [];

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    //countItemFromCart(1);
    viewCartData();
    super.onInit();
  }

  @override
  addItemToCart(itemId) async {
    await cartData.cartAddData(
      itemId.toString(),
      myServices.sharedPreferences.getString("id")!,
    );

    cartItemsData.clear();

    viewCartData();

    update();
  }

  @override
  deleteItemFromCart(itemId) async {
    await cartData.cartDeleteData(
      itemId.toString(),
      myServices.sharedPreferences.getString("id")!,
    );

    cartItemsData.clear();

    viewCartData();

    update();
  }

  // @override
  // countItemFromCart(itemId) async {
  //   var response = await cartData.cartGetCountItemData(
  //     itemId.toString(),
  //     myServices.sharedPreferences.getString("id")!,
  //   );

  //   if (response['status'] == "success") {
  //     countItem = response['data'];
  //   } else {
  //     statusRequest = StatusRequest.offlineFailure;
  //     update();
  //   }

  //   update();
  // }

  @override
  viewCartData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.cartGetData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List data = response['data'];

        if (data.isNotEmpty) {
          Map<String, dynamic> countAndPrice = response['countPrice'];
          totalItems = countAndPrice['total_count_items'];
          totalPriceItems = countAndPrice['total_price_items'];
          cartItemsData.addAll(data.map((e) => CartModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  add(itemId) {
    addItemToCart(itemId);
  }

  @override
  remove(itemId) {
    deleteItemFromCart(itemId);
  }
}
