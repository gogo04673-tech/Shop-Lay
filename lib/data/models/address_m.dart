class AddressModel {
  int? addressId;
  int? addressUsersId;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLang;
  String? addressName;

  AddressModel({
    this.addressId,
    this.addressUsersId,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLang,
    this.addressName,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUsersId = json['address_users_id'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLang = json['address_lang'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['address_users_id'] = addressUsersId;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_lang'] = addressLang;
    data['address_name'] = addressName;
    return data;
  }
}
