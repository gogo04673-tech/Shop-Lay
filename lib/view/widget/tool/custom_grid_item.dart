import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/favorite_controller.dart';
import 'package:shoplay/controller/controller_pages/items_controller.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/core/constant/links/links_server.dart';
import 'package:shoplay/core/functions/translate_data_base.dart';
import 'package:shoplay/data/models/item_m.dart';

class CustomGridItem extends StatelessWidget {
  final List list;

  const CustomGridItem({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerFavorite = Get.put(FavoriteController());
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: .67,

        // crossAxisSpacing: 20,
      ),
      itemCount: list.length,
      itemBuilder: (context, i) {
        controllerFavorite.isFavorite[list[i]['items_id']] =
            list[i]['favorite'];
        return AllItem(itemModel: ItemModel.fromJson(list[i]));
      },
    );
  }
}

class AllItem extends StatelessWidget {
  final ItemModel itemModel;

  const AllItem({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => InkWell(
        onTap: () {
          controller.goToItemDetails(itemModel);
        },
        child: Card(
          color: AppColor.white,
          elevation: 1,
          shadowColor: AppColor.secondaryColor,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                // * Image Product
                Center(
                  child: Hero(
                    tag: "${itemModel.itemsId}",

                    child: CachedNetworkImage(
                      imageUrl: "${AppLinks.itemImage}/${itemModel.itemsImage}",
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                // * Title Product
                Text(
                  translateDataBase(
                            itemModel.itemsNameAr!,
                            itemModel.itemsName!,
                          ) ==
                          itemModel.itemsName!
                      ? itemModel.itemsName!.substring(0, 18)
                      : itemModel
                            .itemsNameAr!, // This Title if Large 17 not finish all title.
                  style: const TextStyle(
                    color: AppColor.textColor,
                    fontSize: 15,
                    height: 0.8,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                // * count seller and Star to  Product
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "55555 (1000)",
                      style: TextStyle(color: AppColor.textColor, fontSize: 12),
                    ),
                    Text(
                      "1000",
                      style: TextStyle(color: AppColor.textColor, fontSize: 12),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "\$${itemModel.itemsPriceDiscount!.toStringAsFixed(2)}  ",
                            style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          if (itemModel.itemsDiscount != 0)
                            TextSpan(
                              text: itemModel.itemsPrice!.toStringAsFixed(1),
                              style: const TextStyle(
                                color: AppColor.greyDeep,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColor.greyDeep,
                              ),
                            ),
                        ],
                      ),
                    ),

                    GetBuilder<FavoriteController>(
                      builder: (controller) {
                        return IconButton(
                          onPressed: () {
                            if (controller.isFavorite[itemModel.itemsId] == 1) {
                              controller.isFavoriteRemoveData(
                                itemModel.itemsId!,
                              );
                              controller.isFavoriteChange(itemModel.itemsId, 0);
                            } else {
                              controller.isFavoriteAddData(
                                itemModel.itemsId!,
                                itemModel.favorite.toString(),
                              );
                              controller.isFavoriteChange(itemModel.itemsId, 1);
                            }
                          },
                          splashColor: AppColor.lightRedColor,
                          highlightColor: AppColor.lightRedColor,
                          icon: controller.isFavorite[itemModel.itemsId] == 1
                              ? const Icon(
                                  Icons.favorite,
                                  color: AppColor.errorColor,
                                )
                              : const Icon(
                                  Icons.favorite_border_outlined,
                                  color: AppColor.errorColor,
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
