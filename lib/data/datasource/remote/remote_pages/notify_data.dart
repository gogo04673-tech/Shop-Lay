import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class NotifyData {
  late Crud crud;

  NotifyData(this.crud);

  getNotificationsData(String userId) async {
    var response = await crud.postRequest(AppLinks.linkNotify, {
      "userId": userId,
    });

    return response.fold((l) => l, (r) => r);
  }
}
