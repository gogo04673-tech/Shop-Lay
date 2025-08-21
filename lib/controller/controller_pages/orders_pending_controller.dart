import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/remote_pages/orders_data.dart';
import 'package:shoplay/data/models/order_m.dart';

abstract class OrdersPendingController extends GetxController {
  changePageOrders(int index);
  getAllOrdersRequest();
  printOrderType(int value);
  printOrderStatus(int value);
}

class OrdersPendingControllerImp extends OrdersPendingController {
  int indexPage = 0;

  List<Map<String, dynamic>> pageOrders = [
    {"name": "All", "index": 0},
    {"name": "Pending", "index": 1},
    {"name": "Completed", "index": 2},
  ];

  List<OrderModel> orders = [];

  OrdersData ordersData = OrdersData(Get.find());

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    getAllOrdersRequest();
    super.onInit();
  }

  @override
  changePageOrders(int index) {
    indexPage = index;
    update();
  }

  @override
  getAllOrdersRequest() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getAllOrdersData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var data = response['data'] as List;
        orders.addAll(data.map((e) => OrderModel.fromJson(e)).toList());
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  String printOrderType(int value) {
    if (value == 0) {
      return "Delivered";
    }
    return "In-Stor Pickup";
  }

  @override
  String printOrderStatus(int value) {
    if (value == 0) {
      return "Processing...";
    } else if (value == 1) {
      return "Your Order is Preparing";
    } else if (value == 3) {
      return "Your Order is on way.";
    }
    return "You Have a order.";
  }
}
