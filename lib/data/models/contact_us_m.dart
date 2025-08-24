class ContactUsModel {
  int? contactUsId;
  int? contactUsUsersId;
  String? contactUsTitle;
  String? contactUsBody;

  ContactUsModel({
    this.contactUsId,
    this.contactUsUsersId,
    this.contactUsTitle,
    this.contactUsBody,
  });

  ContactUsModel.fromJson(Map<String, dynamic> json) {
    contactUsId = json['contact_us_id'];
    contactUsUsersId = json['contact_us_users_id'];
    contactUsTitle = json['contact_us_title'];
    contactUsBody = json['contact_us_body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contact_us_id'] = contactUsId;
    data['contact_us_users_id'] = contactUsUsersId;
    data['contact_us_title'] = contactUsTitle;
    data['contact_us_body'] = contactUsBody;
    return data;
  }
}
