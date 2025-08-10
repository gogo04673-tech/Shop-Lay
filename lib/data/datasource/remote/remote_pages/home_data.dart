import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class HomePageData {
  late Crud crud;

  HomePageData(this.crud);

  getData() async {
    var response = await crud.postRequest(AppLinks.linkHomePage, {});

    return response.fold((l) => l, (r) => r);
  }
}
