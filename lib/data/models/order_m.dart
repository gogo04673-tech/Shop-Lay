class OrderModel {
  int? ordersId;
  int? ordersUsersId;
  int? ordersPaymentMethod;
  int? ordersAddress;
  int? ordersType;
  int? ordersPriceDelivery;
  int? ordersPrice;
  double? ordersTotalPrice;
  int? ordersCoupon;
  int? ordersCouponDiscount;
  String? ordersDateTime;
  int? ordersStatus;

  OrderModel({
    this.ordersId,
    this.ordersUsersId,
    this.ordersPaymentMethod,
    this.ordersAddress,
    this.ordersType,
    this.ordersPriceDelivery,
    this.ordersPrice,
    this.ordersTotalPrice,
    this.ordersCoupon,
    this.ordersCouponDiscount,
    this.ordersDateTime,
    this.ordersStatus,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersId = json['orders_users_id'];
    ordersPaymentMethod = json['orders_payment_method'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPriceDelivery = json['orders_price_delivery'];
    ordersPrice = json['orders_price'];
    ordersTotalPrice = json['orders_total_price'];
    ordersCoupon = json['orders_coupon'];
    ordersCouponDiscount = json['orders_coupon_discount'];
    ordersDateTime = json['orders_date_time'];
    ordersStatus = json['orders_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_users_id'] = ordersUsersId;
    data['orders_payment_method'] = ordersPaymentMethod;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_price_delivery'] = ordersPriceDelivery;
    data['orders_price'] = ordersPrice;
    data['orders_total_price'] = ordersTotalPrice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_coupon_discount'] = ordersCouponDiscount;
    data['orders_date_time'] = ordersDateTime;
    data['orders_status'] = ordersStatus;
    return data;
  }
}
