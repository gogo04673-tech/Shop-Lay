import 'package:shoplay/core/class/crud.dart';
import 'package:shoplay/core/constant/links/links_server.dart';

class CartData {
  late Crud crud;

  CartData(this.crud);

  cartAddData(String itemId, String userId) async {
    var response = await crud.postRequest(AppLinks.linkCartAdd, {
      "userId": userId,
      "itemId": itemId,
    });

    return response.fold((l) => l, (r) => r);
  }

  cartDeleteData(String itemId, String userId) async {
    var response = await crud.postRequest(AppLinks.linkCartDelete, {
      "userId": userId,
      "itemId": itemId,
    });

    return response.fold((l) => l, (r) => r);
  }

  cartGetCountItemData(String itemId, String userId) async {
    var response = await crud.postRequest(AppLinks.linkCartCountItem, {
      "userId": userId,
      "itemId": itemId,
    });

    return response.fold((l) => l, (r) => r);
  }

  cartGetData(String userId) async {
    var response = await crud.postRequest(AppLinks.linkCartView, {
      "userId": userId,
    });

    return response.fold((l) => l, (r) => r);
  }

  // favoriteDelete(String favoriteId) async {
  //   var response = await crud.postRequest(AppLinks.linkFavoriteDelete, {
  //     "favoriteId": favoriteId,
  //   });

  //   return response.fold((l) => l, (r) => r);
  // }
}
