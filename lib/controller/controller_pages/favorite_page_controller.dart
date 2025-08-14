import 'package:get/get.dart';
import 'package:shoplay/core/class/status_request.dart';
import 'package:shoplay/core/constant/approutes.dart';
import 'package:shoplay/core/functions/handling_data.dart';
import 'package:shoplay/core/services/services.dart';
import 'package:shoplay/data/datasource/remote/remote_pages/favorite_data.dart';
import 'package:shoplay/data/models/favorite_m.dart';

class FavoritePageController extends GetxController {
  MyServices myServices = Get.find();

  FavoriteData favoriteData = FavoriteData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  List<FavoriteModel> favorite = [];

  // @override
  // void onInit() {
  //   super.onInit();
  //   //favoriteGetData();
  // }

  goToItemDetails(itemModel) {
    Get.toNamed(AppRoute.itemDetailsPage, arguments: {"itemModel": itemModel});
  }

  favoriteGetData() async {
    favorite.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.favoriteGetData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List data = response['data'];
        favorite.addAll(data.map((e) => FavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  isFavoriteDeleteData(int favoriteId) {
    favoriteData.favoriteDelete(favoriteId.toString());

    favorite.removeWhere((e) => e.favoriteId == favoriteId);

    update();
  }
}
