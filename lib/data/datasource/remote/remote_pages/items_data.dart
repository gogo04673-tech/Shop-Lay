import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class ItemsPageData {
  late Crud crud;

  ItemsPageData(this.crud);

  getData(String categoryId, String userId) async {
    var response = await crud.postRequest(AppLinks.linkItemsPage, {
      "categoryId": categoryId,
      "userId": userId,
    });

    return response.fold((l) => l, (r) => r);
  }
}
