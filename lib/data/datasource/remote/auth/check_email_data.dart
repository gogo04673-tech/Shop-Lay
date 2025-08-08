import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class CheckEmailData {
  static late Crud crud;

  CheckEmailData(Crud c) {
    crud = c;
  }

  postData(String email) async {
    var response = await crud.postRequest(AppLinks.linkCheckEmail, {
      "email": email.trim(),
    });

    return response.fold((l) => l, (r) => r);
  }
}
