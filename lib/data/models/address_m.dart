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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_users_id'] = this.addressUsersId;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_lang'] = this.addressLang;
    data['address_name'] = this.addressName;
    return data;
  }
}
