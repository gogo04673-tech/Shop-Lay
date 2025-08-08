import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class ResetPassData {
  static late Crud crud;

  ResetPassData(Crud c) {
    crud = c;
  }

  postData(String email, String password) async {
    var response = await crud.postRequest(AppLinks.linkResetPass, {
      "email": email.trim(),
      "password": password.trim(),
    });

    return response.fold((l) => l, (r) => r);
  }
}
