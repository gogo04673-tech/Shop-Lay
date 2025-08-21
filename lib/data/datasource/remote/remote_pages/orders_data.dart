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
}
