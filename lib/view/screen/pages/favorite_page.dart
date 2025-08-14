import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/favorite_page_controller.dart';
import 'package:shoplay/view/widget/favorite_widget/view_favorite_items.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    FavoritePageController cont = Get.put(FavoritePageController());
    cont.favoriteGetData();
    return Scaffold(
      appBar: const CustomAppbar(title: "Wishlist"),
      body: GetBuilder<FavoritePageController>(
        builder: (controller) =>
            ListView(children: [ViewFavoriteItems(list: controller.favorite)]),
      ),
    );
  }
}
