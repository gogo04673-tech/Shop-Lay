import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class SignInData {
  static late Crud crud;

  SignInData(Crud c) {
    crud = c;
  }

  postData(String email, String password) async {
    var response = await crud.postRequest(AppLinks.linkSignIn, {
      "email": email.trim(),
      "password": password.trim(),
    });

    return response.fold((l) => l, (r) => r);
  }
}
