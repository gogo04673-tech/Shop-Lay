class OrderDetailsModel {
  double? total;
  int? countItem;
  int? cartId;
  int? cartOrders;
  int? cartUsersId;
  int? cartItemsId;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  double? itemsPrice;
  String? itemsImage;
  String? itemsDesc;
  String? itemsDescAr;
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
  int? addressId;
  int? addressUsersId;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

  OrderDetailsModel({
    this.total,
    this.countItem,
    this.cartId,
    this.cartOrders,
    this.cartUsersId,
    this.cartItemsId,
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsPrice,
    this.itemsImage,
    this.itemsDesc,
    this.itemsDescAr,
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
    this.addressId,
    this.addressUsersId,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
  });

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    countItem = json['count_item'];
    cartId = json['cart_id'];
    cartOrders = json['cart_orders'];
    cartUsersId = json['cart_users_id'];
    cartItemsId = json['cart_items_id'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsPrice = json['items_price'];
    itemsImage = json['items_image'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
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
    addressId = json['address_id'];
    addressUsersId = json['address_users_id'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['count_item'] = countItem;
    data['cart_id'] = cartId;
    data['cart_orders'] = cartOrders;
    data['cart_users_id'] = cartUsersId;
    data['cart_items_id'] = cartItemsId;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_price'] = itemsPrice;
    data['items_image'] = itemsImage;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
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
    data['address_id'] = addressId;
    data['address_users_id'] = addressUsersId;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}
