import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class HomePageData {
  late Crud crud;

  HomePageData(this.crud);

  getSearchData(String itemSearch) async {
    var response = await crud.postRequest(AppLinks.linkSearchPage, {
      "search": itemSearch,
    });

    return response.fold((l) => l, (r) => r);
  }

  getData() async {
    var response = await crud.postRequest(AppLinks.linkHomePage, {});

    return response.fold((l) => l, (r) => r);
  }
}
