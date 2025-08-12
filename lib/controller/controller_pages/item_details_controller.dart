import 'package:get/get.dart';
import 'package:shoplay/data/models/item_m.dart';

abstract class ItemDetailsController extends GetxController {
  init();
}

class ItemDetailsControllerImp extends ItemDetailsController {
  late ItemModel itemModel;

  List colorsItem = [
    {"name": "black", "id": "1", "active": "0"},
    {"name": "red", "id": "2", "active": "0"},
    {"name": "blue", "id": "3", "active": "1"},
    {"name": "green", "id": "4", "active": "0"},
  ];
  List sizeItem = [
    {"name": "s", "id": "1", "active": "0"},
    {"name": "m", "id": "2", "active": "0"},
    {"name": "xl", "id": "3", "active": "1"},
    {"name": "xxl", "id": "4", "active": "0"},
  ];

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  init() {
    itemModel = Get.arguments['itemModel'];
  }
}
