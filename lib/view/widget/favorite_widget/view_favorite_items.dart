import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/favorite_page_controller.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/core/constant/links/links_server.dart';
import 'package:shoplay/data/models/favorite_m.dart';
import 'package:shoplay/view/widget/custombutton/custombuttoncontainer.dart';

class ViewFavoriteItems extends GetView<FavoritePageController> {
  const ViewFavoriteItems({super.key, required this.list});
  final List<FavoriteModel> list;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,

      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 2.5,
      ),

      itemBuilder: (context, i) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                controller.goToItemDetails(list[i]);
              },
              child: ListTile(
                title: Text(list[i].itemsName!),
                subtitle: Text('\$${list[i].itemsPrice}'),
                leading: Hero(
                  tag: "${list[i].itemsId}",
                  child: CachedNetworkImage(
                    imageUrl: "${AppLinks.itemImage}/${list[i].itemsImage}",
                    width: 60,
                    height: 60,
                  ),
                ),

                trailing: GetBuilder<FavoritePageController>(
                  builder: (controller) => IconButton(
                    onPressed: () {
                      controller.isFavoriteDeleteData(list[i].favoriteId!);
                    },
                    icon: const Icon(Icons.favorite),
                  ),
                ),
              ),
            ),

            // * Button Move To Card
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 200,
                  child: CustomButtonContainer(title: "Move To Card"),
                ),

                GetBuilder<FavoritePageController>(
                  builder: (controller) => InkWell(
                    onTap: () {
                      controller.isFavoriteDeleteData(list[i].favoriteId!);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: AppColor.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "Remove",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
