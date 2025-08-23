import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/remote_pages/orders_data.dart';
import 'package:shoplay/data/models/order_details_m.dart';

abstract class OrderDetailsController extends GetxController {
  getOrderDetailsRequest();
  inits();
}

class OrderDetailsControllerImp extends OrderDetailsController {
  late int cartOrder;

  List<OrderDetailsModel> orderDetails = [];

  OrdersData ordersData = OrdersData(Get.find());

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    inits();
    super.onInit();
  }

  @override
  inits() {
    cartOrder = Get.arguments['cartOrder'];
    getOrderDetailsRequest();
  }

  @override
  getOrderDetailsRequest() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getDetailsOrdersData(cartOrder.toString());
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var data = response['data'] as List;
        orderDetails.addAll(
          data.map((e) => OrderDetailsModel.fromJson(e)).toList(),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }
}
