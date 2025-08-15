import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/cart_controller.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/core/constant/imageassets.dart';
import 'package:shoplay/core/constant/links/links_server.dart';
import 'package:shoplay/data/models/cart_m.dart';
import 'package:shoplay/view/widget/cart_widget/custom_icon_count.dart';

class ViewCartItems extends StatelessWidget {
  const ViewCartItems({
    super.key,
    required this.list,
    required this.controller,
  }); //required this.list
  final List<CartModel> list;
  final CartPageControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,

      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 5,
      ),

      itemBuilder: (context, i) {
        return Row(
          children: [
            CachedNetworkImage(
              imageUrl: "${AppLinks.itemImage}/${list[i].itemsImage}",
              width: 60,
              height: 60,
            ),

            // * Title and Price
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: list[i].itemsName!.substring(0, 15),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    TextSpan(
                      text: "\n\$${list[i].total!.toStringAsFixed(2)}",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: AppColor.greyDeep),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Counter Item
            CustomIconCount(
              iconCount: Icons.remove,
              onTap: () {
                controller.remove(list[i].itemsId!);
              },
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Text("${list[i].countItem}"),
            ),
            CustomIconCount(
              iconCount: Icons.add,
              onTap: () {
                controller.add(list[i].itemsId!);
              },
            ),
          ],
        );
      },
    );
  }
}
