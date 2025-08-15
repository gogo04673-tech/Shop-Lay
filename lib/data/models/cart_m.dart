class CartModel {
  double? total;
  int? countItem;
  int? cartId;
  int? cartUsersId;
  int? cartItemsId;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  double? itemsPrice;
  String? itemsImage;
  String? itemsDesc;
  String? itemsDescAr;

  CartModel({
    this.total,
    this.countItem,
    this.cartId,
    this.cartUsersId,
    this.cartItemsId,
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsPrice,
    this.itemsImage,
    this.itemsDesc,
    this.itemsDescAr,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    countItem = json['count_item'];
    cartId = json['cart_id'];
    cartUsersId = json['cart_users_id'];
    cartItemsId = json['cart_items_id'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsPrice = json['items_price'];
    itemsImage = json['items_image'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['count_item'] = countItem;
    data['cart_id'] = cartId;
    data['cart_users_id'] = cartUsersId;
    data['cart_items_id'] = cartItemsId;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_price'] = itemsPrice;
    data['items_image'] = itemsImage;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    return data;
  }
}
