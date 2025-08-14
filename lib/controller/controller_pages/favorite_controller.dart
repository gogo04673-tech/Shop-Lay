import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/remote_pages/favorite_data.dart';

class FavoriteController extends GetxController {
  MyServices myServices = Get.find();

  FavoriteData favoriteData = FavoriteData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  Map isFavorite = {};

  isFavoriteChange(id, value) {
    isFavorite[id] = value;
    update();
  }

  isFavoriteAddData(int itemId, String favorite) async {
    await favoriteData.favoriteAddData(
      itemId.toString(),
      myServices.sharedPreferences.getString("id")!,
    );

    update();
  }

  isFavoriteRemoveData(int itemId) async {
    await favoriteData.favoriteRemoveData(
      itemId.toString(),
      myServices.sharedPreferences.getString("id")!,
    );

    update();
  }
}
