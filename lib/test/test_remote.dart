import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class TestRemote {
  late Crud crud;

  TestRemote(this.crud);

  getData() async {
    var response = await crud.postRequest(AppLinks.linkTest, {});

    return response.fold((l) => l, (r) => r);
  }
}
