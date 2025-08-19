import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/remote_pages/cart_data.dart';
import 'package:shoplay/data/datasource/remote/remote_pages/coupon_data.dart';
import 'package:shoplay/data/models/cart_m.dart';
import 'package:shoplay/data/models/coupon_m.dart';

abstract class CartPageController extends GetxController {
  addItemToCart(int itemId);

  deleteItemFromCart(int itemId);

  add(int itemId);

  remove(int itemId);

  //countItemFromCart(int itemId);

  viewCartData();

  countTotalPrice();

  checkCouponRequest();

  goToCheckout();
}

class CartPageControllerImp extends CartPageController {
  TextEditingController? coupon;

  CartData cartData = CartData(Get.find());
  CouponData couponData = CouponData(Get.find());

  MyServices myServices = Get.find();

  //int countItem = 0;

  int totalItems = 0;

  double totalPriceItems = 0;

  String? nameCoupon;
  String? couponId;
  int discountCoupon = 0;

  List<CartModel> cartItemsData = [];

  CouponModel? couponModel;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    coupon = TextEditingController();
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

  @override
  checkCouponRequest() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await couponData.getCouponData(coupon!.text);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var data = response['data'];
        couponModel = CouponModel.fromJson(data);
        nameCoupon = couponModel!.couponName;
        couponId = couponModel!.couponId!.toString();
        discountCoupon = couponModel!.couponDiscount!;
      }
    }
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  double countTotalPrice() {
    return totalPriceItems - (totalPriceItems * discountCoupon / 100);
  }

  @override
  goToCheckout() {
    Get.toNamed(
      AppRoute.checkoutPage,
      arguments: {
        "couponId": couponId ?? "0",
        "totalPriceOrder": totalPriceItems,
        "orderSummary": cartItemsData,
      },
    );
  }
}
