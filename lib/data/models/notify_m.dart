class NotifyModel {
  int? notificationsId;
  int? notificationsUsersId;
  String? notificationsTitle;
  String? notificationsBody;
  String? notificationsDate;

  NotifyModel({
    this.notificationsId,
    this.notificationsUsersId,
    this.notificationsTitle,
    this.notificationsBody,
    this.notificationsDate,
  });

  NotifyModel.fromJson(Map<String, dynamic> json) {
    notificationsId = json['notifications_id'];
    notificationsUsersId = json['notifications_users_id'];
    notificationsTitle = json['notifications_title'];
    notificationsBody = json['notifications_body'];
    notificationsDate = json['notifications_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notifications_id'] = notificationsId;
    data['notifications_users_id'] = notificationsUsersId;
    data['notifications_title'] = notificationsTitle;
    data['notifications_body'] = notificationsBody;
    data['notifications_date'] = notificationsDate;
    return data;
  }
}
