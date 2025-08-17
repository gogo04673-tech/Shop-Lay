import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class CouponData {
  late Crud crud;

  CouponData(this.crud);

  getCouponData(String couponName) async {
    var response = await crud.postRequest(AppLinks.linkCoupon, {
      "couponName": couponName,
    });

    return response.fold((l) => l, (r) => r);
  }
}
