import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class SignUpData {
  static late Crud crud;

  SignUpData(Crud c) {
    crud = c;
  }

  static postData(
    String username,
    String email,
    String phone,
    String password,
  ) async {
    var response = await crud.postRequest(AppLinks.linkSignUp, {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
