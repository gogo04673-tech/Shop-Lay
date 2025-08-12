import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class ItemsPageData {
  late Crud crud;

  ItemsPageData(this.crud);

  getData(String categoryId) async {
    var response = await crud.postRequest(AppLinks.linkItemsPage, {
      "categoryId": categoryId,
    });

    return response.fold((l) => l, (r) => r);
  }
}
