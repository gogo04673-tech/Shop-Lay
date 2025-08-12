import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        return AllItem(itemModel: ItemModel.fromJson(list[i]));
      },
    );
  }
}

class AllItem extends GetView<ItemsControllerImp> {
  final ItemModel itemModel;
  const AllItem({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                  fontWeight: FontWeight.bold,
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
                  Text(
                    "\$${itemModel.itemsPrice}",
                    style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
