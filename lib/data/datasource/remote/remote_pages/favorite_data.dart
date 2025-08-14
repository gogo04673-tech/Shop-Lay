import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class FavoriteData {
  late Crud crud;

  FavoriteData(this.crud);

  favoriteAddData(String itemId, String userId) async {
    var response = await crud.postRequest(AppLinks.linkFavoriteAdd, {
      "userId": userId,
      "itemId": itemId,
    });

    return response.fold((l) => l, (r) => r);
  }

  favoriteRemoveData(String itemId, String userId) async {
    var response = await crud.postRequest(AppLinks.linkFavoriteRemove, {
      "userId": userId,
      "itemId": itemId,
    });

    return response.fold((l) => l, (r) => r);
  }

  favoriteGetData(String userId) async {
    var response = await crud.postRequest(AppLinks.linkFavoriteView, {
      "userId": userId,
    });

    return response.fold((l) => l, (r) => r);
  }

  favoriteDelete(String favoriteId) async {
    var response = await crud.postRequest(AppLinks.linkFavoriteDelete, {
      "favoriteId": favoriteId,
    });

    return response.fold((l) => l, (r) => r);
  }
}
