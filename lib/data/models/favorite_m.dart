class FavoriteModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCategories;
  int? favoriteId;
  int? favoriteItemId;
  int? favoriteUserId;
  int? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPhone;
  int? usersVerifycode;
  int? usersApprove;
  String? usersCreate;
  String? usersPassword;

  FavoriteModel({
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDesc,
    this.itemsDescAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsDate,
    this.itemsCategories,
    this.favoriteId,
    this.favoriteItemId,
    this.favoriteUserId,
    this.usersId,
    this.usersName,
    this.usersEmail,
    this.usersPhone,
    this.usersVerifycode,
    this.usersApprove,
    this.usersCreate,
    this.usersPassword,
  });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategories = json['items_categories'];
    favoriteId = json['favorite_id'];
    favoriteItemId = json['favorite_item_id'];
    favoriteUserId = json['favorite_user_id'];
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersVerifycode = json['users_verifycode'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
    usersPassword = json['users_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_date'] = itemsDate;
    data['items_categories'] = itemsCategories;
    data['favorite_id'] = favoriteId;
    data['favorite_item_id'] = favoriteItemId;
    data['favorite_user_id'] = favoriteUserId;
    data['users_id'] = usersId;
    data['users_name'] = usersName;
    data['users_email'] = usersEmail;
    data['users_phone'] = usersPhone;
    data['users_verifycode'] = usersVerifycode;
    data['users_approve'] = usersApprove;
    data['users_create'] = usersCreate;
    data['users_password'] = usersPassword;
    return data;
  }
}
