import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class ContactUsData {
  late Crud crud;

  ContactUsData(this.crud);

  addContactUs(String userId, String title, String body) async {
    var response = await crud.postRequest(AppLinks.linkContactUsAdd, {
      "userId": userId,
      "title": title,
      "body": body,
    });

    return response.fold((l) => l, (r) => r);
  }

  getContactUs(String userId) async {
    var response = await crud.postRequest(AppLinks.linkContactUsView, {
      "userId": userId,
    });

    return response.fold((l) => l, (r) => r);
  }
}
