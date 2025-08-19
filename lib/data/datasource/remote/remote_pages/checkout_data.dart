import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class CheckoutData {
  late Crud crud;

  CheckoutData(this.crud);

  checkoutData(
    String userId,
    String ordersPaymentMethod,
    String ordersAddress,
    String ordersType,
    String ordersPriceDelivery,
    String ordersPrice,
    String ordersCoupon,
  ) async {
    var response = await crud.postRequest(AppLinks.linkCheckout, {
      "userId": userId,
      "ordersPaymentMethod": ordersPaymentMethod,
      "ordersAddress": ordersAddress,
      "ordersType": ordersType,
      "ordersPriceDelivery": ordersPriceDelivery,
      "ordersPrice": ordersPrice,
      "ordersCoupon": ordersCoupon,
    });

    return response.fold((l) => l, (r) => r);
  }
}
