import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class OrdersData {
  late Crud crud;

  OrdersData(this.crud);

  getAllOrdersData(String userId) async {
    var response = await crud.postRequest(AppLinks.linkAllOrders, {
      "userId": userId,
    });

    return response.fold((l) => l, (r) => r);
  }

  getAllPendingOrdersData(String userId) async {
    var response = await crud.postRequest(AppLinks.linkAllPendingOrders, {
      "userId": userId,
    });

    return response.fold((l) => l, (r) => r);
  }

  getDetailsOrdersData(String cartOrder) async {
    var response = await crud.postRequest(AppLinks.linkDetailsOrders, {
      "cartOrders": cartOrder,
    });

    return response.fold((l) => l, (r) => r);
  }

  getCompletedOrdersData(String userId) async {
    var response = await crud.postRequest(AppLinks.linkAllCompletedOrders, {
      "userId": userId,
    });

    return response.fold((l) => l, (r) => r);
  }

  ordersDeleteData(String orderId) async {
    var response = await crud.postRequest(AppLinks.linkDeleteOrders, {
      "orderId": orderId,
    });

    return response.fold((l) => l, (r) => r);
  }

  ordersRatingData(String orderId, String rating, String ratingCommit) async {
    var response = await crud.postRequest(AppLinks.linkRatingOrders, {
      "orderId": orderId,
      "ordersRating": rating,
      "ordersRatingCommit": ratingCommit,
    });

    return response.fold((l) => l, (r) => r);
  }
}
