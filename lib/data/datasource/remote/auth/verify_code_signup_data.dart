import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class VerifyCodeSignupData {
  static late Crud crud;

  VerifyCodeSignupData(Crud c) {
    crud = c;
  }

  postData(String email, String verifyCode) async {
    var response = await crud.postRequest(AppLinks.linkVerifyCodeSignUp, {
      "email": email.trim(),
      "verifyCode": verifyCode,
    });

    return response.fold((l) => l, (r) => r);
  }
}
